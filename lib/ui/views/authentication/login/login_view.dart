import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/wrappers/authentication_wrapper.dart';
import 'package:kula/utils/enums.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticationWrapper(
      wrapperBackgroundImageSize: WrapperBackgroundImageSize.large,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40.h,
                child: Image.asset(
                  AppImages.appNameLogo,
                  scale: 2,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Welcome Back!",
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Convenient food delivery",
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium
                    ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
