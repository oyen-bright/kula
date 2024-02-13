import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/views/bottom_navigator/bottom_navigator.dart';
import 'package:kula/utils/orientation_utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    setPortraitOrientation();
    super.initState();
    Future.delayed(Constants.splashScreenDelay,
        () => AppRouter.router.pushReplacement(AppRoutes.login));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.onSurface,
      child: Stack(
          children: AnimateList(
              interval: 400.ms,
              effects: [const FadeEffect()],
              children:
                  [_buildAppName(), _buildSplashImage()].reversed.toList())),
    );
  }

  Positioned _buildSplashImage() {
    return Positioned(
        bottom: 0,
        child: Image.asset(
          AppImages.splashImage,
          scale: 2,
        ));
  }

  Center _buildAppName() {
    return Center(
      child: Image.asset(
        AppImages.appName,
        scale: 2,
      ),
    );
  }
}
