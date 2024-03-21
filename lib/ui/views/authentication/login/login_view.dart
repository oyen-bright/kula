library login_view;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/auth_cubit/auth_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/mixins/validation.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/components/wrappers/authentication_wrapper.dart';
import 'package:kula/utils/enums.dart';

part 'constants/strings.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with ValidationMixin {
  final _emailController = TextEditingController()
    ..text = "doligot841@storesr.com";
  final _passwordController = TextEditingController()..text = "Itsahahman1.";

  final _formKey = GlobalKey<FormState>();

  void signUp() {
    AppRouter.router.pushReplacement(AppRoutes.signUp);
  }

  void onError(String error) {
    context.showSnackBar(error);
  }

  void onLogin() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<AuthCubit>().loginWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
  }

  void goHome() {
    AppRouter.router.pushReplacement(AppRoutes.homeWelcome);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                key: _formKey,
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
                      fieldTitle: Strings.email,
                      hintText: Strings.emailHint,
                      controller: _emailController,
                      validator: validateRequired,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                      textInputAction: TextInputAction.done,
                      fieldTitle: Strings.password,
                      validator: validateRequired,
                      controller: _passwordController,
                      onFieldSubmitted: (_) => onLogin(),
                      hintText: Strings.passwordHint,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppElevatedButton(
                      elevation: 0,
                      onPressed: onLogin,
                      title: Strings.signInButton,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: Strings.signUpText,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        children: [
                          TextSpan(
                            text: Strings.signUpLink,
                            style: const TextStyle(
                                color: AppColors.hyperLinkColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()..onTap = signUp,
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
    );
  }
}
