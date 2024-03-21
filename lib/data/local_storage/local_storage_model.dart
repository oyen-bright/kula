import 'package:hive_flutter/hive_flutter.dart';
import 'package:kula/utils/types.dart';

part 'local_storage_model.g.dart';

@HiveType(typeId: 1)
class LocalStorageModel {
  static const String boxName = "local_storage_model";

  @HiveField(0)
  Token? accessToken;

  @HiveField(1)
  String? userId;

  @HiveField(2)
  List<String>? recentlyViewedVehicles = [];

  @HiveField(3)
  String? smartCarAccessToken;
}
