import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kula/config/app_environment.dart';
import 'package:kula/data/http/endpoints.dart';
import 'package:kula/data/local_storage/local_storage.dart';
import 'package:kula/utils/enums.dart';
import 'package:kula/utils/types.dart';

import 'http_exceptions.dart';

/// This Dart file contains the implementation of a base HTTP client for sending requests to a RESTful API.
/// The class provides methods for sending GET, PATCH, PUT, POST, and DELETE requests.
/// It uses the http package to make requests and throws custom exceptions if any errors occur.
/// The class also supports token-based authentication, and tokens are stored using the GetStorage package.

/// Methods Overview:
/// - `init()`: Initializes the HTTP client.
/// - `getRequest()`: Sends a GET request to the specified endpoint.
/// - `patchRequest()`: Sends a PATCH request to the specified endpoint (TODO: Implement).
/// - `putRequest()`: Sends a PUT request to the specified endpoint (TODO: Implement).
/// - `postRequest()`: Sends a POST request to the specified endpoint (TODO: Implement).
/// - `deleteRequest()`: Sends a DELETE request to the specified endpoint (TODO: Implement).
/// - 'multipartRequest() : Send a multipartRequest request to the specified endpoint,

/// Class Variables:
/// - `timeOutDuration`: The timeout duration for HTTP requests in seconds.
/// - `httpClient`: The HTTP client instance.
/// - `defaultHeaders`: Default headers for HTTP requests.

/// Usage:
/// - To use this HTTP client, call `init()` first to initialize the client.
/// - Then, utilize the provided methods to send various HTTP requests.

/// Important Notes:
/// - The class logs the request URL, response status code, and response body to the console for debugging purposes.
/// - Token-based authentication is supported, and tokens can be automatically retrieved from GetStorage.

/// Example Usage:
/// ```dart
/// HttpClient.init();
/// final response = await HttpClient.getRequest(endpoint: 'https://api.example.com/data');
/// print(response.body);
class HttpClient {
  HttpClient._();

  /// The timeout duration for HTTP requests in seconds.
  static const int timeOutDuration = 35;

  /// The HTTP client instance.
  static late final http.Client? httpClient;

  static late final StreamController<bool> _expiredTokenStreamController;

  static Stream<bool> get expiredTokenStream =>
      _expiredTokenStreamController.stream;

  /// Default headers for HTTP requests.
  static Map<String, String> get defaultHeaders {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'X-API-KEY': AppEnvironment.apiKey,
      if (accessToken != null) 'Authorization': "Bearer ${accessToken!.access}"
    };
  }

  static Token? get accessToken {
    return LocalStorage.token;
  }

  /// Initialize the HTTP client.
  static void init() {
    httpClient = http.Client();
    _expiredTokenStreamController = StreamController<bool>.broadcast();
    log("HTTP Client Created", name: "HTTP");
  }

  /// Get the HTTP client instance.
  static http.Client get client {
    if (httpClient == null) {
      throw Exception('HTTP client has not been initialized, call init first');
    } else {
      return httpClient!;
    }
  }

  /// Send a GET request.
  static Future<http.Response> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, String> headers = const {},
  }) async {
    var uri = Uri.parse(endpoint).replace(queryParameters: queryParameters);
    final Map<String, String> requestHeaders = {...defaultHeaders, ...headers};

    try {
      final http.Response response = await client
          .get(uri, headers: requestHeaders)
          .timeout(const Duration(seconds: timeOutDuration));

      log(requestHeaders.toString());

      log("${response.statusCode} $endpoint", name: "HTTP GET REQUEST");

      if (requestHeaders.containsKey("Authorization") && accessToken != null) {
        if (response.statusCode == 403) {
          if (await _refreshAccessToken(accessToken!)) {
            return getRequest(
                endpoint: endpoint,
                queryParameters: queryParameters,
                headers: headers);
          }
        }
      }

      return _processResponse(response);
    } on TimeoutException {
      throw AppTimeoutException();
    } on SocketException catch (_) {
      throw NoInternetException();
    } catch (e) {
      log(e.toString(), name: "HTTP GET REQUEST ERROR");
      rethrow;
    }
  }

  static Future<http.Response> multipartRequest({
    required String endpoint,
    required HttpMethod method,
    String? bearerToken,
    void Function(double)? progress,
    Map<String, String> headers = const {},
    Map<String, String> fields = const {},
    List<({String contentType, File file, String fileField})> files = const [],
  }) async {
    try {
      // final totalBytes = _calculateTotalBytes(files);
      // var bytesSoFar = 0;

      var request = http.MultipartRequest(
        method.value,
        Uri.parse(endpoint),
      );
      request.headers.addAll({...defaultHeaders, ...headers});

      if (fields.isNotEmpty) {
        request.fields.addAll(fields);
      }

      for (var data in files) {
        var fileStream = http.ByteStream(data.file.openRead());
        var fileLength = await data.file.length();
        var multipartFile = http.MultipartFile(
          data.fileField,
          fileStream,
          fileLength,
          filename: data.contentType,
        );
        request.files.add(multipartFile);
        // fileStream.listen(
        //   (List<int> chunk) {
        //     bytesSoFar += chunk.length;
        //     if (progress != null) {
        //       var percentage = (bytesSoFar / totalBytes) * 100;
        //       progress(percentage);
        //     }
        //   },
        // );
      }

      final http.StreamedResponse streamedResponse = await request
          .send()
          .timeout(const Duration(seconds: timeOutDuration));
      final http.Response response =
          await http.Response.fromStream(streamedResponse);

      return _processResponse(response);
    } on TimeoutException {
      throw AppTimeoutException();
    } on SocketException catch (_) {
      throw NoInternetException();
    } catch (e) {
      log(e.toString(), name: "Multipart ${method.value} REQUEST ERROR");
      rethrow;
    }
  }

  /// Send a PUT request.
  Future<http.Response> putRequest({
    required String endpoint,
    required Map<String, dynamic> payload,
  }) async {
    // TODO: Implement PATCH request logic.
    // Return type should be http.Response.
    throw UnimplementedError();
  }

  /// Send a PATCH request.
  static Future<http.Response> patchRequest({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> payload,
    Map<String, String> headers = const {},
  }) async {
    var uri = Uri.parse(endpoint).replace(queryParameters: queryParameters);
    final Map<String, String> requestHeaders = {...defaultHeaders, ...headers};

    log(payload.toString(), name: "HTTP Request Payload");

    try {
      final http.Response response = await client
          .patch(uri, headers: requestHeaders, body: jsonEncode(payload))
          .timeout(const Duration(seconds: timeOutDuration));

      log("${response.statusCode} $endpoint", name: "HTTP PATCH REQUEST");

      if (requestHeaders.containsKey("Authorization") && accessToken != null) {
        if (response.statusCode == 403) {
          if (await _refreshAccessToken(accessToken!)) {
            return patchRequest(
                endpoint: endpoint,
                queryParameters: queryParameters,
                payload: payload,
                headers: headers);
          }
        }
      }

      return _processResponse(response);
    } on TimeoutException {
      throw AppTimeoutException();
    } on SocketException catch (_) {
      throw NoInternetException();
    } catch (e) {
      log(e.toString(), name: "HTTP PATCH REQUEST ERROR");
      rethrow;
    }
  }

  /// Send a POST request.
  static Future<http.Response> postRequest({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> payload,
    Map<String, String> headers = const {},
  }) async {
    var uri = Uri.parse(endpoint).replace(queryParameters: queryParameters);
    final Map<String, String> requestHeaders = {...defaultHeaders, ...headers};

    log(payload.toString(), name: "HTTP Request Payload");

    try {
      final http.Response response = await client
          .post(uri, headers: requestHeaders, body: jsonEncode(payload))
          .timeout(const Duration(seconds: timeOutDuration));

      log("${response.statusCode} $endpoint", name: "HTTP POST REQUEST");

      if (requestHeaders.containsKey("Authorization") && accessToken != null) {
        if (response.statusCode == 403) {
          if (await _refreshAccessToken(accessToken!)) {
            return postRequest(
                endpoint: endpoint,
                queryParameters: queryParameters,
                payload: payload,
                headers: headers);
          }
        }
      }

      return _processResponse(response);
    } on TimeoutException {
      throw AppTimeoutException();
    } on SocketException catch (_) {
      throw NoInternetException();
    } catch (e) {
      log(e.toString(), name: "HTTP POST REQUEST ERROR");
      rethrow;
    }
  }

  /// Send a DELETE request.
  static Future<http.Response> deleteRequest({
    required String endpoint,
    Map<String, String> headers = const {},
  }) async {
    var uri = Uri.parse(endpoint);
    final Map<String, String> requestHeaders = {...defaultHeaders, ...headers};

    try {
      final http.Response response = await client
          .delete(uri, headers: requestHeaders)
          .timeout(const Duration(seconds: timeOutDuration));

      log("${response.statusCode} $endpoint", name: "HTTP DELETE REQUEST");

      return _processResponse(response);
    } on TimeoutException {
      throw AppTimeoutException();
    } on SocketException catch (_) {
      throw NoInternetException();
    } catch (e) {
      log(e.toString(), name: "HTTP DELETE REQUEST ERROR");
      rethrow;
    }
  }

  static Future<bool> _refreshAccessToken(Token token) async {
    try {
      // Define the URI for the refresh token endpoint
      var uri = Uri.parse(Endpoint.refreshToken);

      // Define the request body with the refresh token
      var body = json.encode({"refresh": token.refresh});

      final http.Response response = await client
          .post(uri, headers: {...defaultHeaders}, body: body)
          .timeout(const Duration(seconds: timeOutDuration));

      log("REFRESH TOKEN ", name: response.statusCode.toString());

      // If the response status code is 200 OK, update the access token and return true
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;

        final Token token = (
          access: jsonData['data']['access_token'],
          refresh: jsonData['data']['refresh_token']
        );

        LocalStorage.saveAccessToken(token);

        return true;
      }

      _expiredTokenStreamController.add(true);

      return false;
    } on SocketException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  /// Process the HTTP response and handle different status codes.
  static http.Response _processResponse(http.Response response) {
    var body = response.body;

    log(body.toString(), name: "HTTP Request Response");
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        var responseJson = response;
        return responseJson;
      case 400:
        throw BadRequestException(
            jsonDecode(body)['message'] ?? body.toString(),
            response.statusCode);
      case 401:
        throw UnAuthorizedException(
            jsonDecode(body)['message'] ?? body.toString(),
            response.statusCode);
      case 403:
        throw UnAuthorizedException(
            jsonDecode(body)['message'] ?? body.toString(),
            response.statusCode);

      case 422:
        var data = jsonDecode(body)['data'];
        var errorMessages = '';
        data.forEach((key, value) {
          errorMessages += '$key: ${value.join(', ')}\n';
        });
        throw UnAuthorizedException(errorMessages, response.statusCode);
      case 404:
        throw NotFoundException(jsonDecode(body)['message'] ?? body.toString(),
            response.statusCode);
      case 500:
      default:
        throw ServerErrorException(
            'Sorry, something went wrong. Please try again later',
            response.statusCode);
    }
  }
}
