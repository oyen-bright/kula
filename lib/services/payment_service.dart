import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_environment.dart';
import 'package:kula/cubits/user_cubit/user_model.dart';
import 'package:kula/data/http/http_repository.dart';
import 'package:uuid/uuid.dart';

abstract class _PaymentService {
  Future<PaymentServiceResponse<String?>> verifyTransaction(
      String transactionId);

  Future<PaymentServiceResponse<String?>> makePayment(
      BuildContext context, String amount, User user, String txRef);
}

class PaymentServiceResponse<T> {
  final String? error;
  final T data;

  PaymentServiceResponse({required this.error, required this.data});
}

class PaymentService implements _PaymentService {
  late final Uuid uuid;
  PaymentService() : uuid = const Uuid();
  static void logger(String error) {
    log(error, name: "Payment Service ");
  }

  String get _generateTxRef {
    return uuid.v4();
  }

  @override
  Future<PaymentServiceResponse<String?>> verifyTransaction(
      String transactionId) async {
    try {
      final response = await AppRepository.verifyTransaction(transactionId);
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      log(data.toString());

      final message = data['message'];

      return PaymentServiceResponse<String?>(error: null, data: message);
    } catch (e) {
      PaymentService.logger(e.toString());
      return PaymentServiceResponse<String?>(error: e.toString(), data: null);
    }
  }

  @override
  Future<PaymentServiceResponse<String?>> makePayment(
      BuildContext context, String amount, User user, String txRef) async {
    try {
      final Customer customer = Customer(
          name: user.name, phoneNumber: user.phoneNumber, email: user.email);
      final Flutterwave flutterwave = Flutterwave(
          context: context,
          publicKey: AppConstants.flutterWaveKeys.publicKey,
          currency: AppConstants.flutterWaveKeys.currency.first,
          redirectUrl: "kula://payment",
          txRef: txRef,
          amount: amount,
          customer: customer,
          paymentOptions: "ussd, card, barter, payattitude",
          customization: Customization(
              title: "Kula", description: "Make Payment to complete Order"),
          isTestMode: AppEnvironment.isDevelopment);

      final ChargeResponse response = await flutterwave.charge();

      if (response.transactionId == null) {
        return PaymentServiceResponse<String?>(error: null, data: null);
      }

      if (response.success ?? false) {
        print(response.toJson());

        return verifyTransaction(response.transactionId!);
        return PaymentServiceResponse<String?>(
            error: null, data: response.transactionId);
      }

      return PaymentServiceResponse<String?>(
          error: "An error occurred during payment please try again ",
          data: null);
    } catch (e) {
      PaymentService.logger(e.toString());
      return PaymentServiceResponse<String?>(error: e.toString(), data: null);
    }
  }
}
