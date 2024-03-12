import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

class CreateReview extends StatelessWidget {
  const CreateReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        title: "Write Review",
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.padding.horizontal),
                child: Column(
                  children: [
                    AppTextField(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      maxLines: 7,
                      hintText: "Write how you fel about the food you got.",
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Text("Pounded Yam"),
                            SizedBox(
                              width: 8.w,
                            ),
                            Image.asset(
                              AppImages.downArrow,
                              scale: 2,
                            )
                          ],
                        ))
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
            title: "Submit",
            onPressed: () {},
          ).withHorViewPadding,
          SizedBox(
            height: 44.h,
          ),
        ],
      ),
    );
  }
}
