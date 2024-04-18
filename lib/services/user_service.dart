import 'dart:convert';
import 'dart:developer';

import 'package:kula/cubits/user_cubit/wallet_model.dart';
import 'package:kula/data/http/http_repository.dart';

abstract class _UserService {
  Future<UserServiceResponse<String?>> sendFeedBack(String feedback);
  Future<UserServiceResponse<WalletData?>> getWallet();
  Future<UserServiceResponse<String?>> updateProfile(
      {required String firstName, required String lastName});
}

class UserServiceResponse<T> {
  final String? error;
  final T data;

  UserServiceResponse({required this.error, required this.data});
}

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

      print(body);
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
}
