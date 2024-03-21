// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/mixins/validation.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/services/otp_service.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/components/wrappers/authentication_wrapper.dart';
import 'package:kula/ui/views/authentication/sign_up/models/registration_input.dart';

class PhoneNumberVerificationView extends StatefulWidget {
  final RegistrationInput inputs;
  const PhoneNumberVerificationView({
    Key? key,
    required this.inputs,
  }) : super(key: key);

  @override
  State<PhoneNumberVerificationView> createState() =>
      _PhoneNumberVerificationViewState();
}

class _PhoneNumberVerificationViewState
    extends State<PhoneNumberVerificationView> with ValidationMixin {
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
    if (!formKey.currentState!.validate()) {
      return;
    }

    final phoneNumber = "0${phoneNumberController.text}";
    FocusScope.of(context).unfocus();
    context.read<LoadingCubit>().loading();
    context.read<OTPService>().phoneNumberOTP(phoneNumber).then((res) {
      context.read<LoadingCubit>().loaded();
      if (res.error != null) {
        context.showSnackBar(res.error);
        return;
      }
      context.showSnackBar(res.data ?? "");
      AppRouter.router.push(AppRoutes.signUpPhoneVerificationConfirm,
          extra: widget.inputs..phoneNumber = phoneNumber);
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
                  const Text(
                    "Enter your phone number for easy ordering and verification",
                    style:
                        TextStyle(color: AppColors.greyTextColor, fontSize: 16),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextField(
                    autofocus: true,
                    fieldTitle: "Phone number",
                    keyboardType: TextInputType.phone,
                    validator: validateNigerianPhoneNumber,
                    prefixText: "+234 ",
                    onChanged: (value) {
                      phoneNumberController.text = value;
                      setState(() {});
                    },
                    suffixIcon: IconButton(
                      icon: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: phoneNumberController.text.length >= 10
                                ? context.colorScheme.primary
                                : AppColors.disabledColor2,
                          ),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          )),
                      onPressed: phoneNumberController.text.length >= 10
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
