// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/auth_cubit/auth_cubit.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/services/otp_service.dart';
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
    if (!formKey.currentState!.validate()) {
      return;
    }

    context.read<LoadingCubit>().loading(message: "Verifying OTP");

    context
        .read<OTPService>()
        .phoneNumberVerify(
            widget.inputs.phoneNumber ?? "", phoneNumberController.text)
        .then((res) {
      context.read<LoadingCubit>().loaded();
      if (res.error != null) {
        context.showSnackBar(res.error);
        return;
      }

      context.showSnackBar(res.data);
      context.read<AuthCubit>().createAccount(data: widget.inputs);
    });
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
                  Text(
                    "Enter the verification code you received on +234${widget.inputs.phoneNumber}",
                    style: const TextStyle(
                        color: AppColors.greyTextColor, fontSize: 16),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextField(
                    validator: (input) {
                      if (input != null && input.length >= 6) {
                        return null;
                      }
                      return "Invalid input";
                    },
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    autofocus: true,
                    onChanged: (value) {
                      phoneNumberController.text = value;
                      setState(() {});
                    },
                    suffixIcon: IconButton(
                      icon: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: phoneNumberController.text.length >= 6
                                ? context.colorScheme.primary
                                : AppColors.disabledColor2,
                          ),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          )),
                      onPressed: phoneNumberController.text.length >= 6
                          ? () => onNext()
                          : null,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
