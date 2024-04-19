import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/cubits/user_cubit/user_cubit.dart';
import 'package:kula/cubits/user_cubit/user_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/mixins/validation.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/services/user_service.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/components/wrappers/will_pop_wrapper.dart';
import 'package:kula/ui/views/profile/components/delete_account_dialog.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> with ValidationMixin {
  late final TextEditingController firstNameController;

  late final TextEditingController lastNameController;

  late final User user;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    user = context.read<UserCubit>().state.user!;
    firstNameController = TextEditingController()..text = user.firstName;
    lastNameController = TextEditingController()..text = user.lastName;
  }

  void onSave() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<LoadingCubit>().loading();
    context
        .read<UserService>()
        .updateProfile(
            firstName: firstNameController.text,
            lastName: lastNameController.text)
        .then((res) {
      if (!context.mounted) {
        return;
      }
      context.read<LoadingCubit>().loaded();
      if (res.error != null) {
        context.showSnackBar(res.error);
        return;
      }
      context.read<UserCubit>().updateUserDetails(user.copyWith(
          firstName: firstNameController.text,
          lastName: lastNameController.text));
      context.showSnackBar(res.data);
    });
  }

  void onDeleteAccount() {
    const DeleteAccountDialog().asDialog<bool?>(context).then((res) async {
      if (res == null || !res) {
        return;
      }

      context.read<LoadingCubit>().loading();

      final response = await context.read<UserService>().deleteAccount();

      if (!mounted || !context.mounted) {
        return;
      }

      if (response.error != null) {
        context.showSnackBar(response.error ?? "");
        return;
      }

      context.showSnackBar(response.data ?? "");
      AppRouter.router.go(AppRoutes.login);
      return;
    });
  }

  @override
  void dispose() {
    lastNameController.dispose();
    firstNameController.dispose();
    super.dispose();
  }

  bool isSaveButtonVisible() {
    return lastNameController.text != user.lastName ||
        firstNameController.text != user.firstName;
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserCubit>().state.user!;

    return WillPopWrapper(
      child: Scaffold(
        appBar: ViewAppBar(
          title: "Profile Details",
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
          child: Form(
            key: _formKey,
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
                          validator: validateRequired,
                          controller: firstNameController,
                          fieldTitle: "First Name",
                          onChanged: (_) => setState(() {}),
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
                          validator: validateRequired,
                          onChanged: (_) => setState(() {}),
                          controller: lastNameController,
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
                          initialValue: user.phoneNumber,
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
                          initialValue: user.email,
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
                if (isSaveButtonVisible()) ...{
                  SizedBox(
                    height: 10.h,
                  ),
                  AppElevatedButton(
                    elevation: 0,
                    title: "Save",
                    onPressed: onSave,
                  ),
                },
                SizedBox(
                  height: 10.h,
                ),
                AppElevatedButton(
                  elevation: 0,
                  title: "Delete Account",
                  backgroundColor: Colors.red,
                  onPressed: onDeleteAccount,
                ),
                SizedBox(
                  height: 35.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
