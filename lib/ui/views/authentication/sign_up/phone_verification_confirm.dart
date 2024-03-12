// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/components/wrappers/authentication_wrapper.dart';
import 'package:kula/ui/views/authentication/sign_up/models/registration_input.dart';

class PhoneNumberVerificationConfirmView extends StatefulWidget {
  final RegistrationInput inputs;
  const PhoneNumberVerificationConfirmView({
    Key? key,
    required this.inputs,
  }) : super(key: key);

  @override
  State<PhoneNumberVerificationConfirmView> createState() =>
      _PhoneNumberVerificationConfirmViewState();
}

class _PhoneNumberVerificationConfirmViewState
    extends State<PhoneNumberVerificationConfirmView> {
  int inputCount = 0;

  late final TextEditingController phoneNumberController;

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  void onNext() {
    if (formKey.currentState!.validate()) {
      AppRouter.router.push(AppRoutes.signUpWelcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationWrapper(
      viewTitle: "Phone Verification",
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Enter the verification code you received on +2349023232323",
                    style:
                        TextStyle(color: AppColors.greyTextColor, fontSize: 16),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextField(
                    hintText: "+234",
                    onChanged: (value) {
                      if (value.length > 10) {
                        setState(() {
                          inputCount = value.length;
                        });
                      }
                    },
                    suffixIcon: IconButton(
                      icon: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: inputCount > 10
                                ? context.colorScheme.primary
                                : AppColors.disabledColor2,
                          ),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          )),
                      onPressed: inputCount > 10 ? () => onNext() : null,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
