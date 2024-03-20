import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/services/otp_service.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/inputs/otp_input_field.dart';
import 'package:kula/ui/components/wrappers/authentication_wrapper.dart';
import 'package:kula/ui/views/authentication/sign_up/models/registration_input.dart';

class EmailVerificationView extends StatefulWidget {
  final RegistrationInput inputs;
  const EmailVerificationView({super.key, required this.inputs});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  void onNext() {
    if (inputOTP.isEmpty) {
      context.showSnackBar(
          "Please provide the OTP sent to your email:${widget.inputs.email}");
      return;
    }

    context.read<LoadingCubit>().loading();
    context
        .read<OTPService>()
        .emailOTPVerify(widget.inputs.email ?? "", inputOTP)
        .then((res) {
      context.read<LoadingCubit>().loaded();

      if (res.error != null) {
        context.showSnackBar(res.error);
        return;
      }

      AppRouter.router
          .pushReplacement(AppRoutes.signUpUserDetails, extra: widget.inputs);
    });
  }

  String inputOTP = "";

  @override
  Widget build(BuildContext context) {
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
                elevation: 0,
                onPressed: onNext,
              ),
              SizedBox(
                height: 24.h,
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
            SizedBox(
              height: 9.h,
            ),
            const Text(
              "Please verify your email by inputting the 6-digit code sent to your mail.",
              style: TextStyle(color: AppColors.greyTextColor, fontSize: 16),
            ),
            SizedBox(
              height: 8.h,
            ),
            OTPInputField(
              otpLength: 6,
              onChanged: (value) {
                inputOTP = value;
                if (inputOTP.length >= 6) {
                  onNext();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
