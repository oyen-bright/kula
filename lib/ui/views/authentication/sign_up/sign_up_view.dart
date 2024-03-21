library sign_up_view;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/auth_cubit/auth_cubit.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/mixins/validation.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/services/otp_service.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/components/wrappers/authentication_wrapper.dart';
import 'package:kula/ui/views/authentication/sign_up/models/registration_input.dart';
import 'package:kula/utils/enums.dart';

part 'constants/strings.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with ValidationMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  void onLogin() {
    AppRouter.router.pushReplacement(AppRoutes.login);
  }

  void onError(String error) {
    context.showSnackBar(error);
  }

  void goHome() {
    AppRouter.router.pushReplacement(AppRoutes.homeWelcome);
  }

  void onRegister() async {
    FocusScope.of(context).unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }

    final RegistrationInput input = RegistrationInput()
      ..email = emailController.text
      ..password = passwordController.text;

    context.read<LoadingCubit>().loading();
    context.read<OTPService>().emailOTP(input.email ?? "").then((value) {
      context.read<LoadingCubit>().loaded();
      if (value.error == null) {
        context.showSnackBar(value.data.toString());
        AppRouter.router.push(AppRoutes.signUpEmailVerification, extra: input);
        return;
      }
      context.showSnackBar(value.error);
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.mapOrNull(
          authenticated: (_) => goHome(),
          error: (state) => onError(state.errorMessage),
        );
      },
      child: AuthenticationWrapper(
        wrapperBackgroundImage: WrapperBackgroundImage.two,
        wrapperBackgroundImageSize: WrapperBackgroundImageSize.large,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.padding.horizontal),
              child: Form(
                key: formKey,
                child: AutofillGroup(
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
                        style: context.textTheme.titleLarge?.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        Strings.convenientDelivery,
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleMedium?.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      AppTextField(
                        isRequired: true,
                        fieldTitle: Strings.email,
                        autofillHints: const [AutofillHints.email],
                        hintText: Strings.emailHint,
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        validator: validateEmail,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppTextField(
                        isRequired: true,
                        autofillHints: const [AutofillHints.password],
                        fieldTitle: Strings.password,
                        hintText: Strings.passwordHint,
                        textInputAction: TextInputAction.done,
                        controller: passwordController,
                        validator: validatePasswordCreateAccount,
                        onFieldSubmitted: (_) => onRegister,
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
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: [
                            TextSpan(
                              text: Strings.signInLink,
                              style: const TextStyle(
                                  color: AppColors.hyperLinkColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = onLogin,
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
        ),
      ),
    );
  }
}
