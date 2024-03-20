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

  static bool get isDevelopment => environmentConfig == Environment.development;

  static late Environment? environmentConfig;

  static init(Environment arg) async {
    await dotenv.load(fileName: ".env");
    environmentConfig = arg;

    log("Initialized", name: "Environment Config");
  }

  static Environment get environment {
    if (environmentConfig == null) {
      throw Exception('Environment has not been initialized. Call init first.');
    } else {
      return environmentConfig!;
    }
  }

  static String get apiURL {
    return dotenv.env["${environment.value}_BASE_URL"]!;
  }

  static String get apiKey {
    print(dotenv.env["${environment.value}_X_CSRF_TOKEN"]!);
    return dotenv.env["${environment.value}_X_CSRF_TOKEN"]!;
  }
}
