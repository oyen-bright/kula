/*
  Configuration related to app's local database,
  like database name, version, tables, etc.
 */

import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import 'models/app_config_model.dart';

class AppConfig {
  AppConfig._();

  //init Hive
  static Future<void> init() async {
    Hive.registerAdapter(AppConfigModelAdapter());
    await Hive.openBox<AppConfigModel>(AppConfigModel.boxName);
    log("App configuration initialized");
  }

  // get app config info
  static AppConfigModel? get _appConfigInfo {
    final box = Hive.box<AppConfigModel>(AppConfigModel.boxName);
    try {
      return box.get(0, defaultValue: AppConfigModel());
    } catch (e) {
      return AppConfigModel();
    }
  }

  void clearUserLocation() {}

  // save app config info
  static Future<void> _save(AppConfigModel appConfigInfo) async {
    final box = Hive.box<AppConfigModel>(AppConfigModel.boxName);
    try {
      await box.putAt(0, appConfigInfo);
    } catch (e) {
      box.put(0, appConfigInfo);
    }
  }

  // set finished onboarding
  static Future<void> setFinishedOnboarding(bool finishedOnboarding) async {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    appConfigInfo.finishedOnboarding = finishedOnboarding;
    await AppConfig._save(appConfigInfo);
  }

  // get finished onboarding
  static bool get finishedOnboarding {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    return appConfigInfo.finishedOnboarding ?? false;
  }
}
