import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/blocs/bloc_provider.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/cubit_provider.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/services/service_provider.dart';
import 'package:kula/themes/app_theme.dart';
import 'package:kula/ui/components/overlays/loading_overlay.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoriesProvider(
      child: AppCubitProvider(
        child: AppBlocProvider(
            child: ScreenUtilInit(
                designSize: AppConstants.designSize,
                builder: ((context, child) {
                  return MaterialApp.router(
                    theme: AppTheme.theme,
                    debugShowCheckedModeBanner: false,
                    routerConfig: AppRouter.router,
                    builder: (context, child) {
                      final loadingState = context.watch<LoadingCubit>().state;
                      return _buildApp(context, child, loadingState);
                    },
                  );
                }))),
      ),
    );
  }

  Widget _buildApp(
      BuildContext context, Widget? child, LoadingState loadingState) {
    final isLoading =
        loadingState.when(initial: () => false, loading: (_, __, ___) => true);
    return WillPopScope(
      onWillPop: () async {
        return isLoading;
      },
      child: Stack(
        children: [
          if (child != null) child,
          loadingState.when(
            initial: SizedBox.shrink,
            loading: (String? message, (String, void Function(), int?)? action1,
                    (String, void Function(), int?)? action2) =>
                Positioned.fill(
              child: LoadingOverlay(
                message: message,
                action1: action1,
                action2: action2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
