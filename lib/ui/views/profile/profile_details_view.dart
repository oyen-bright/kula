import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/user_cubit/user_cubit.dart';
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
    final user = context.read<UserCubit>().state.user!;

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
                    SizedBox(
                      height: 17.h,
                    ),
                    AppTextField(
                      readOnly: true,
                      controller: TextEditingController()
                        ..text = user.firstName,
                      fieldTitle: "First Name",
                      hintText: "Justin",
                      suffixIcon: Image.asset(
                        AppImages.editIcon,
                        scale: 2,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                      readOnly: true,
                      controller: TextEditingController()..text = user.lastName,
                      fieldTitle: "Last Name",
                      hintText: "Jarvis",
                      suffixIcon: Image.asset(
                        AppImages.editIcon,
                        scale: 2,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                      readOnly: true,
                      controller: TextEditingController()
                        ..text = user.phoneNumber,
                      fieldTitle: "Phone number",
                      hintText: "09025608832",
                      suffixIcon: Image.asset(
                        AppImages.editIcon,
                        scale: 2,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                      readOnly: true,
                      controller: TextEditingController()..text = user.email,
                      fieldTitle: "Email",
                      hintText: "example@example.com",
                      suffixIcon: Image.asset(
                        AppImages.editIcon,
                        scale: 2,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            AppElevatedButton(
              elevation: 0,
              title: "Delete Account",
              backgroundColor: Colors.red,
              onPressed: () {
                const DeleteAccountDialog().asDialog(context);
              },
            ),
            SizedBox(
              height: 35.h,
            )
          ],
        ),
      ),
    );
  }
}
