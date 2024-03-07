import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/views/profile/components/delete_account_dialog.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        title: "Profile Details",
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      fieldTitle: "First Name",
                      hintText: "Justin",
                      suffixIcon: Image.asset(
                        AppImages.editIcon,
                        scale: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      fieldTitle: "Last Name",
                      hintText: "Jarvis",
                      suffixIcon: Image.asset(
                        AppImages.editIcon,
                        scale: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      fieldTitle: "Phone number",
                      hintText: "09025608832",
                      suffixIcon: Image.asset(
                        AppImages.editIcon,
                        scale: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      fieldTitle: "Email",
                      hintText: "example@example.com",
                      suffixIcon: Image.asset(
                        AppImages.editIcon,
                        scale: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AppElevatedButton(
              elevation: 0,
              title: "Delete Account",
              backgroundColor: Colors.red,
              onPressed: () {
                const DeleteAccountDialog().asDialog(context);
              },
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
