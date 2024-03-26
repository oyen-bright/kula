import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/mixins/validation.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/views/authentication/sign_up/models/address_input.dart';

class AddAdditionalAddress extends StatefulWidget {
  final InputAddress? address;
  const AddAdditionalAddress({Key? key, this.address}) : super(key: key);

  @override
  _AddAdditionalAddressState createState() => _AddAdditionalAddressState();
}

class _AddAdditionalAddressState extends State<AddAdditionalAddress>
    with ValidationMixin {
  final houseAddressController = TextEditingController();
  final houseNumberController = TextEditingController();
  final floorNumberController = TextEditingController();
  final deliveryInstructionsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    houseAddressController.dispose();
    houseNumberController.dispose();
    floorNumberController.dispose();
    deliveryInstructionsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.address != null) {
      houseAddressController.text = widget.address?.street ?? "";
      houseNumberController.text = widget.address?.houseNumber ?? "";
      floorNumberController.text = widget.address?.floorNumber ?? "";
      deliveryInstructionsController.text =
          widget.address?.additionalInfo ?? "";
    }
    super.initState();
  }

  void onContinue() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.pop(InputAddress()
      ..street = houseAddressController.text
      ..houseNumber = houseNumberController.text
      ..floorNumber = floorNumberController.text
      ..additionalInfo = deliveryInstructionsController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        automaticallyImplyLeading: false,
        title: "Add alternative address",
        actions: [
          TextButton(
            onPressed: () => AppRouter.router.pop(),
            child: const Text("Cancel"),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.padding.horizontal,
        ),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Enter the addresses that your food would be delivered to. You can add multiple addresses.",
                        style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      _buildSectionTitle('Address details ', true),
                      SizedBox(height: 8.h),
                      AppTextField(
                        controller: houseAddressController,
                        validator: validateRequired,
                        hintText: "Enter house address",
                        suffixIcon: Image.asset(
                          AppImages.mapIcon,
                          scale: 2,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      AppTextField(
                        validator: validateRequired,
                        controller: houseNumberController,
                        hintText: "House Number",
                      ),
                      SizedBox(height: 12.h),
                      AppTextField(
                        validator: validateRequired,
                        controller: floorNumberController,
                        hintText: "Floor number",
                      ),
                      SizedBox(height: 24.h),
                      _buildSectionTitle('Additional Information '),
                      SizedBox(height: 8.h),
                      AppTextField(
                        controller: deliveryInstructionsController,
                        hintText: "Extra Delivery Instructions",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AppElevatedButton(
              elevation: 0,
              title: "Continue",
              onPressed: onContinue,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  RichText _buildSectionTitle(String title, [bool showRequired = false]) {
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black,
        ),
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
}
