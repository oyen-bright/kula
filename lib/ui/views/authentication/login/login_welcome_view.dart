import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_images.dart';

class LoginWelcomeView extends StatefulWidget {
  const LoginWelcomeView({super.key});

  @override
  State<LoginWelcomeView> createState() => _LoginWelcomeViewState();
}

class _LoginWelcomeViewState extends State<LoginWelcomeView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        AppConstants.welcomeDelay, () => AppRouter.router.go(AppRoutes.home));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: context.theme.scaffoldBackgroundColor,
        child: Stack(
            children: AnimateList(
                interval: 400.ms,
                effects: [const FadeEffect()],
                children:
                    [_buildAppName(), _buildSplashImage()].reversed.toList())),
      ),
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
    return const Center(
      child: Text(
        "Welcome back",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
    );
  }
}
