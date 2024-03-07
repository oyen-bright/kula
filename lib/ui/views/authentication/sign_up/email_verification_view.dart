import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/inputs/otp_input_field.dart';
import 'package:kula/ui/components/wrappers/authentication_wrapper.dart';
import 'package:kula/ui/views/authentication/sign_up/models/registration_input.dart';

class EmailVerificationView extends StatelessWidget {
  final RegistrationInput inputs;
  const EmailVerificationView({super.key, required this.inputs});

  @override
  Widget build(BuildContext context) {
    void onNext() {
      AppRouter.router.push(AppRoutes.signUpUserDetails, extra: inputs);
    }

    return AuthenticationWrapper(
        viewTitle: "Email Verification",
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildOTPInput(),
              AppElevatedButton(
                title: "Next",
                onPressed: onNext,
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }

  Expanded _buildOTPInput() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Please verify your email by inputting the 6-digit code sent to your mail.",
              style: TextStyle(color: AppColors.greyTextColor, fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            OTPInputField(
              otpLength: 6,
              onChanged: (value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
