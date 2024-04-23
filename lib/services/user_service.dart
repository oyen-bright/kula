import 'dart:convert';
import 'dart:developer';

import 'package:kula/cubits/user_cubit/wallet_model.dart';
import 'package:kula/data/http/http_repository.dart';
import 'package:kula/data/local_storage/local_storage.dart';

abstract class _UserService {
  Future<UserServiceResponse<String?>> sendFeedBack(String feedback);
  Future<UserServiceResponse<WalletData?>> getWallet();
  Future<UserServiceResponse<LegalData?>> getTermsOfUse();
  Future<UserServiceResponse<LegalData?>> getPolicy();
  Future<UserServiceResponse<String?>> deleteAccount();
  Future<UserServiceResponse<List<Map>?>> customerSupportLink();
  Future<UserServiceResponse<String?>> updateProfile(
      {required String firstName, required String lastName});
}

class UserServiceResponse<T> {
  final String? error;
  final T data;

  UserServiceResponse({required this.error, required this.data});
}

typedef LegalData = ({String title, String data});

class UserService implements _UserService {
  static void logger(String error) {
    log(error, name: "UserService ");
  }

  @override
  Future<UserServiceResponse<String?>> sendFeedBack(String feedback) async {
    try {
      final payload = {"feedback": feedback};
      final response = await AppRepository.sendFeedback(payload);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      return UserServiceResponse(error: null, data: body['message']);
    } catch (e) {
      UserService.logger(
        e.toString(),
      );
      return UserServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<UserServiceResponse<String?>> updateProfile(
      {required String firstName, required String lastName}) async {
    try {
      if (firstName.isEmpty || lastName.isEmpty) {
        throw "";
      }
      final payload = {"first_name": firstName, "last_name": lastName};
      final response = await AppRepository.updateProfile(payload);
      final body = jsonDecode(response.body) as Map<String, dynamic>;

      return UserServiceResponse(error: null, data: body['message']);
    } catch (e) {
      UserService.logger(
        e.toString(),
      );
      return UserServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<UserServiceResponse<WalletData?>> getWallet() async {
    try {
      final response = await AppRepository.getWallet();
      final body = jsonDecode(response.body) as Map<String, dynamic>;

      final walletData = WalletData.fromJson(body['data']);

      return UserServiceResponse<WalletData?>(error: null, data: walletData);
    } catch (e) {
      UserService.logger(
        e.toString(),
      );
      return UserServiceResponse<WalletData?>(error: e.toString(), data: null);
    }
  }

  @override
  Future<UserServiceResponse<LegalData?>> getPolicy() async {
    try {
      final response = await AppRepository.getPolicy();
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final data = ((body['data']) as List?)?.firstOrNull;

      if (data == null) {
        return UserServiceResponse<LegalData?>(
            error: "Not Available please try again later", data: null);
      }

      var {'key': key, 'value': value} = data;

      LocalStorage.savePrivacyPolicy(value);

      return UserServiceResponse<LegalData?>(
          error: null, data: (data: value, title: key));
    } catch (e) {
      UserService.logger(
        e.toString(),
      );
      return UserServiceResponse<LegalData?>(error: e.toString(), data: null);
    }
  }

  @override
  Future<UserServiceResponse<LegalData?>> getTermsOfUse() async {
    try {
      final response = await AppRepository.getTerms();
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final data = ((body['data']) as List?)?.firstOrNull;

      if (data == null) {
        return UserServiceResponse<LegalData?>(
            error: "Not Available please try again later", data: null);
      }

      var {'key': key, 'value': value} = data;

      LocalStorage.saveTerms(value);

      return UserServiceResponse<LegalData?>(
          error: null, data: (data: value, title: key));
    } catch (e) {
      UserService.logger(
        e.toString(),
      );
      return UserServiceResponse<LegalData?>(error: e.toString(), data: null);
    }
  }

  @override
  Future<UserServiceResponse<String?>> deleteAccount() async {
    //TODO Test Delete Account
    try {
      final response = await AppRepository.deleteAccount();
      final body = jsonDecode(response.body) as Map<String, dynamic>;

      return UserServiceResponse<String?>(error: null, data: body['message']);
    } catch (e) {
      UserService.logger(
        e.toString(),
      );
      return UserServiceResponse<String?>(error: e.toString(), data: null);
    }
  }

  @override
  Future<UserServiceResponse<List<Map>?>> customerSupportLink() async {
    try {
      final response = await AppRepository.getCustomerSupportLink();
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final data = body['data'] as List;

      log(data.toString());

      List<Map<String, dynamic>> mappedList = data.map((item) {
        return {"key": item['key'].toString(), "value": item['value']};
      }).toList();

      LocalStorage.saveCustomerSupport(mappedList);

      return UserServiceResponse<List<Map>?>(
          error: null, data: List.from(mappedList));
    } catch (e) {
      UserService.logger(
        e.toString(),
      );
      return UserServiceResponse<List<Map>?>(error: e.toString(), data: null);
    }
  }
}
