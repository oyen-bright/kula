import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

import 'add_additional_address.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        title: "Add Address",
        actions: [
          TextButton(
              onPressed: () => AppRouter.router.pop(),
              child: const Text("Skip"))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.viewPaddingHorizontal),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Enter the addresses that your food would be delivered to. You can add multiple addresses.",
                        style: TextStyle(
                            color: AppColors.greyTextColor, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildSectionTitle('Address details ', true),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextField(
                        hintText: "Enter house address",
                        suffixIcon: Image.asset(
                          AppImages.mapIcon,
                          scale: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AppTextField(
                        hintText: "House Number",
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AppTextField(
                        hintText: "floor number",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildSectionTitle('Additional Information '),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextField(
                        hintText: "Extra Delivery Instructions",
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      _buildSectionTitle('Additional Addresses '),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextField(
                        readOnly: true,
                        onTap: () => _addAlternativeAddress(context),
                        hintText: "Address 2",
                        suffixIcon: Image.asset(
                          AppImages.plusIcon,
                          scale: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //TODO: dotted lines
                      AppTextField(
                        readOnly: true,
                        onTap: () => _addAlternativeAddress(context),
                        hintText: "Address 3",
                        suffixIcon: Image.asset(
                          AppImages.plusIcon,
                          scale: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () => _addAlternativeAddress(context),
                          child: const Text("Add another address"))
                    ],
                  ),
                ),
              ),
              AppElevatedButton(
                elevation: 0,
                title: "Continue",
                onPressed: () {},
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  RichText _buildSectionTitle(String title, [bool showRequired = false]) {
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
        children: <TextSpan>[
          if (showRequired)
            const TextSpan(
              text: '*',
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }

  void _addAlternativeAddress(BuildContext context) {
    const AddAdditionalAddress()
        .asBottomSheet(context, isScrollControlled: true, topSafeArea: true);
  }
}
