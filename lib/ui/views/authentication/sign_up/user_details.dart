import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/mixins/validation.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/components/wrappers/authentication_wrapper.dart';
import 'package:kula/ui/views/authentication/sign_up/models/registration_input.dart';

class UserDetailsView extends StatelessWidget with ValidationMixin {
  final RegistrationInput inputs;
  const UserDetailsView({super.key, required this.inputs});

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    void onNext() {
      if (formKey.currentState!.validate()) {
        AppRouter.router.push(AppRoutes.signUpPhoneVerification,
            extra: inputs
              ..firstName = firstNameController.text
              ..lastName = lastNameController.text);
      }
    }

    return AuthenticationWrapper(
      viewTitle: "Name Details",
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Enter your first and last name",
                      style: TextStyle(
                          color: AppColors.greyTextColor, fontSize: 16),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                      fieldTitle: "First Name",
                      hintText: "John",
                      isRequired: true,
                      validator: validateRequired,
                      controller: firstNameController,
                      textCapitalization: TextCapitalization.words,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                      controller: lastNameController,
                      fieldTitle: "Last Name",
                      hintText: "Doe",
                      isRequired: true,
                      validator: validateRequired,
                      textCapitalization: TextCapitalization.words,
                    )
                  ],
                ),
              )),
              AppElevatedButton(
                elevation: 0,
                title: "Next",
                onPressed: onNext,
              ),
              SizedBox(
                height: 24.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
