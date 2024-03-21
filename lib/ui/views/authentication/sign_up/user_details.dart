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

class UserDetailsView extends StatefulWidget {
  final RegistrationInput inputs;
  const UserDetailsView({super.key, required this.inputs});

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView>
    with ValidationMixin {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onNext() {
    FocusScope.of(context).unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }
    AppRouter.router.push(AppRoutes.signUpPhoneVerification,
        extra: widget.inputs
          ..firstName = firstNameController.text
          ..lastName = lastNameController.text);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationWrapper(
      viewTitle: "Name Details",
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
        child: Form(
          key: formKey,
          child: AutofillGroup(
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
                        autofillHints: const [AutofillHints.name],
                        validator: validateRequired,
                        textInputAction: TextInputAction.next,
                        controller: firstNameController,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppTextField(
                        autofillHints: const [AutofillHints.familyName],
                        controller: lastNameController,
                        fieldTitle: "Last Name",
                        hintText: "Doe",
                        textInputAction: TextInputAction.done,
                        isRequired: true,
                        onFieldSubmitted: (_) => onNext(),
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
      ),
    );
  }
}
