import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kula/config/app_config.dart';
import 'package:kula/config/app_environment.dart';
import 'package:kula/data/http/http_client.dart';
import 'package:kula/data/local_storage/local_storage.dart';
import 'package:kula/observer/bloc_observer.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/utils/enums.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppRouter.instance;
  GoogleFonts.config.allowRuntimeFetching = true;
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  await Hive.initFlutter();
  await AppEnvironment.init(
    Environment.development,
  );
  await AppConfig.init();
  HttpClient.init();
  await LocalStorage.init();
  runApp(const MyApp());

  // runApp(DevicePreview(
  //   enabled: false,
  //   // enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(), // Wrap your app
  // ));
}
