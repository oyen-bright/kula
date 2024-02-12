/*
  Configuration based on different environments
  like development, production, staging, etc.
  For example, different API base URLs for different environments.
 */
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kula/utils/enums.dart';

class AppEnvironment {
  AppEnvironment._();

  static late bool isWalletConnectModal;

  static bool get isDevelopment => environmentConfig == Environment.development;

  static late Environment? environmentConfig;

  static init(Environment arg, {bool useWalletConnectModal = true}) async {
    await dotenv.load(fileName: ".env");
    environmentConfig = arg;
    isWalletConnectModal = useWalletConnectModal;
    log("Initialized", name: "Environment Config");
  }

  static Environment get environment {
    if (environmentConfig == null) {
      throw Exception('Environment has not been initialized. Call init first.');
    } else {
      return environmentConfig!;
    }
  }

  static String get baseUrl {
    return dotenv.env["${environment.value}_BASE_URL"]!;
  }

  static String get walletConnectID {
    return dotenv.env["${environment.value}_WALLET_CONNECT_ID"]!;
  }
}
