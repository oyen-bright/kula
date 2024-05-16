import 'dart:convert';
import 'dart:developer';

import 'package:kula/cubits/user_cubit/user_model.dart';
import 'package:kula/data/http/http_repository.dart';
import 'package:kula/data/local_storage/local_storage.dart';
import 'package:kula/utils/types.dart';

abstract class _AuthService {
  Future<AuthServiceResponse> loginWithEmailAndPassword(
      String email, String password);

  Future<AuthServiceResponse> createAccount({
    required String firsName,
    required String lastName,
    required String phoneNumber,
    required String dob,
    required String email,
    required String password,
  });
}

class AuthServiceResponse<T> {
  final String? error;
  final T data;

  AuthServiceResponse({required this.error, required this.data});
}

class AuthService implements _AuthService {
  @override
  Future<AuthServiceResponse<({Token token, User user})?>> createAccount({
    required String firsName,
    required String lastName,
    required String phoneNumber,
    required String dob,
    required String email,
    required String password,
  }) async {
    try {
      final response = await AppRepository.createAccount(
          firsName, lastName, phoneNumber, dob, email, password);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final User user = User.fromJson(body['data']['user']);
      final Token token = (
        access: body['data']['token']['access_token'],
        refresh: body['data']['token']['refresh_token']
      );
      saveToken(token);

      return AuthServiceResponse(error: null, data: (token: token, user: user));
    } catch (e) {
      AuthService.logger(
        e.toString(),
      );
      return AuthServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<AuthServiceResponse<({Token token, User user})?>>
      loginWithEmailAndPassword(String email, String password) async {
    try {
      final response = await AppRepository.login(email, password);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final User user = User.fromJson(body['data']['user']);

      final Token token = (
        access: body['data']['token']['access_token'],
        refresh: body['data']['token']['refresh_token']
      );
      saveToken(token);
      return AuthServiceResponse(error: null, data: (token: token, user: user));
    } catch (e) {
      AuthService.logger(
        e.toString(),
      );
      return AuthServiceResponse(error: e.toString(), data: null);
    }
  }

  static void logger(String error) {
    log(error, name: "AuthService ");
  }

  static void saveToken(Token token) {
    LocalStorage.saveAccessToken(token);
  }
}
