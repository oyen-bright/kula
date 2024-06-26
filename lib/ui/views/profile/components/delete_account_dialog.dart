import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius.large)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              AppImages.deleteAccountIcon,
              scale: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Delete Account",
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Are you sure you want to delete this account?",
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge
                  ?.copyWith(fontSize: 15, color: AppColors.slateGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxWidth: 155, minWidth: 0),
                        child: AppElevatedButton(
                          title: "Yes",
                          textStyle:
                              const TextStyle().copyWith(color: Colors.black),
                          elevation: 0,
                          backgroundColor:
                              const Color.fromRGBO(92, 246, 191, 0.44),
                          borderColor: AppColors.tertiaryColor,
                          onPressed: () => context.pop(true),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: 155, minWidth: 0),
                    child: AppElevatedButton(
                        elevation: 0,
                        backgroundColor: Colors.red,
                        borderColor: Colors.red,
                        title: "Cancel",
                        onPressed: () => context.pop(false)),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
