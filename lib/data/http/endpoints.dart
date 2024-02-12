import 'package:kula/config/app_environment.dart';
import 'package:kula/utils/enums.dart';

class Endpoint {
  Endpoint._();

  static bool get isProduction {
    return AppEnvironment.environment == Environment.production;
  }
}
