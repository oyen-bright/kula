import 'dart:convert';
import 'dart:developer';

import 'package:kula/data/http/http_repository.dart';

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

class AuthServiceResponse {
  final String? error;
  final dynamic data;

  AuthServiceResponse({required this.error, required this.data});
}

class AuthService implements _AuthService {
  @override
  Future<AuthServiceResponse> createAccount({
    required String firsName,
    required String lastName,
    required String phoneNumber,
    required String dob,
    required String email,
    required String password,
  }) async {
    try {
      final response = await HttpRepository.createAccount(
          firsName, lastName, phoneNumber, dob, email, password);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return AuthServiceResponse(error: null, data: data);
    } catch (e) {
      AuthService.logger(
        e.toString(),
      );
      return AuthServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<AuthServiceResponse> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await HttpRepository.login(email, password);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return AuthServiceResponse(error: null, data: data);
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
}
