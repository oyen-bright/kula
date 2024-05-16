import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:kula/utils/types.dart';

import 'local_storage_model.dart';

class LocalStorage {
  LocalStorage._();

  static Future<void> init() async {
    try {
      Hive.registerAdapter(LocalStorageModelAdapter());
      await Hive.openBox<LocalStorageModel>(LocalStorageModel.boxName);

      log("Initialized", name: "Local Storage");
    } catch (e) {
      log(e.toString(), name: "Local Storage");
    }
  }

  static LocalStorageModel get _localStorageData {
    final box = Hive.box<LocalStorageModel>(LocalStorageModel.boxName);
    try {
      return box.get(0, defaultValue: LocalStorageModel()) ??
          LocalStorageModel();
    } catch (e) {
      return LocalStorageModel();
    }
  }

  static Future<void> _save(LocalStorageModel localStorage) async {
    final box = Hive.box<LocalStorageModel>(LocalStorageModel.boxName);
    try {
      await box.putAt(0, localStorage);
    } catch (e) {
      box.put(0, localStorage);
    }
  }

  static Future<void> saveAccessToken(Token token) async {
    final data = LocalStorage._localStorageData;
    data.accessToken = token;
    await LocalStorage._save(data);
  }

  static Future<void> saveTerms(String terms) async {
    final data = LocalStorage._localStorageData;
    data.termsOfUse = terms;
    await LocalStorage._save(data);
  }

  static Future<void> savePrivacyPolicy(String privacyPolicy) async {
    final data = LocalStorage._localStorageData;
    data.privacyPolicy = privacyPolicy;
    await LocalStorage._save(data);
  }

  static Future<void> saveCustomerSupport(List<Map> customerSupport) async {
    final data = LocalStorage._localStorageData;
    data.customerSupport = customerSupport;
    await LocalStorage._save(data);
  }

  static Future<void> deleteAccessToken() async {
    final data = LocalStorage._localStorageData;
    data.accessToken = null;
    await LocalStorage._save(data);
  }

  static String? get accessToken {
    return _localStorageData.accessToken?.access;
  }

  static String? get refreshToken {
    return _localStorageData.accessToken?.refresh;
  }

  static Token? get token {
    return _localStorageData.accessToken;
  }

  static String? get terms {
    return _localStorageData.termsOfUse;
  }

  static String? get policy {
    return _localStorageData.privacyPolicy;
  }

  static List<Map>? get customerSupport {
    return _localStorageData.customerSupport;
  }
}
