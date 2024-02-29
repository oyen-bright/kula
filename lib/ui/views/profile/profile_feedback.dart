import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

class ProfileFeedBack extends StatelessWidget {
  const ProfileFeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        title: "Provide Feedback",
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.viewPaddingHorizontal),
                child: Column(
                  children: [
                    AppTextField(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      maxLines: 7,
                      hintText:
                          "We could not find what you were looking for, tell us about it so we can serve you better.",
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AppElevatedButton(
            elevation: 0,
            title: "Provide Feedback",
            onPressed: () {},
          ).withHorViewPadding,
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
