library sign_up_view;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/mixins/validation.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/components/wrappers/authentication_wrapper.dart';
import 'package:kula/ui/views/authentication/sign_up/models/registration_input.dart';
import 'package:kula/utils/enums.dart';

part 'constants/strings.dart';

class SignUpView extends StatelessWidget with ValidationMixin {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    void onLogin() {
      AppRouter.router.pushReplacement(AppRoutes.login);
    }

    void onRegister() {
      if (formKey.currentState!.validate()) {
        final RegistrationInput input = RegistrationInput()
          ..email = emailController.text
          ..password = passwordController.text;

        AppRouter.router.push(AppRoutes.signUpEmailVerification, extra: input);
      }
    }

    return AuthenticationWrapper(
      wrapperBackgroundImage: WrapperBackgroundImage.two,
      wrapperBackgroundImageSize: WrapperBackgroundImageSize.large,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding.horizontal),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 41.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    child: Image.asset(
                      AppImages.appNameLogo,
                      scale: 2,
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  Text(
                    Strings.welcomeBack,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge
                        ?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    Strings.convenientDelivery,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  AppTextField(
                    isRequired: true,
                    fieldTitle: Strings.email,
                    hintText: Strings.emailHint,
                    controller: emailController,
                    validator: validateEmail,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextField(
                    isRequired: true,
                    fieldTitle: Strings.password,
                    hintText: Strings.passwordHint,
                    controller: passwordController,
                    validator: validatePassword,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppElevatedButton(
                    elevation: 0,
                    onPressed: onRegister,
                    title: Strings.signInButton,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: Strings.signUpText,
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(
                          text: Strings.signInLink,
                          style: const TextStyle(
                              color: AppColors.hyperLinkColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = onLogin,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
