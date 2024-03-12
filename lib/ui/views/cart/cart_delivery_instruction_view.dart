import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

class CartExtraDeliveryView extends StatelessWidget {
  const CartExtraDeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(title: "Extra delivery instruction"),
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
                      hintText: "Enter any extra instructions here.",
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          AppElevatedButton(
            elevation: 0,
            title: "Add Instruction",
            onPressed: () {},
          ).withHorViewPadding,
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
