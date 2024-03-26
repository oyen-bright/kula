import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/address_cubit/address_cubit.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/mixins/validation.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/services/address_service.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/views/authentication/sign_up/models/address_input.dart';
import 'package:kula/utils/enums.dart';

import 'add_additional_address.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> with ValidationMixin {
  List<InputAddress> addresses = [];

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

  void onContinue() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    addresses.add(InputAddress()
      ..street = houseAddressController.text
      ..houseNumber = houseNumberController.text
      ..floorNumber = floorNumberController.text
      ..additionalInfo = deliveryInstructionsController.text);

    context.read<LoadingCubit>().loading();
    context.read<AddressService>().addAddress(addresses).then((res) {
      if (mounted && context.mounted) {
        context.read<LoadingCubit>().loaded();
        if (res.error != null) {
          context.showSnackBar(res.error, BarType.error);
          return;
        }
        context.read<AddressCubit>().getAddress();
        context.showSnackBar(
          res.data,
        );
        context.pop();
      }
    });
  }

  void _addAlternativeAddress(BuildContext context, {InputAddress? address}) {
    AddAdditionalAddress(
      address: address,
    )
        .asBottomSheet<InputAddress?>(context,
            isScrollControlled: true, topSafeArea: true)
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    addresses.add(value);
                  })
                }
            });
  }

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
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
          child: Form(
            key: _formKey,
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
                        SizedBox(
                          height: 18.h,
                        ),
                        _buildSectionTitle('Address details ', true),
                        SizedBox(
                          height: 8.h,
                        ),
                        AppTextField(
                          controller: houseAddressController,
                          validator: validateRequired,
                          hintText: "Enter house address",
                          suffixIcon: Image.asset(
                            AppImages.mapIcon,
                            scale: 2,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        AppTextField(
                          hintText: "House Number",
                          validator: validateRequired,
                          controller: houseNumberController,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        AppTextField(
                          validator: validateRequired,
                          controller: floorNumberController,
                          hintText: "floor number",
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        _buildSectionTitle('Additional Information '),
                        SizedBox(
                          height: 8.h,
                        ),
                        AppTextField(
                          controller: deliveryInstructionsController,
                          hintText: "Extra Delivery Instructions",
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        _buildSectionTitle('Additional Addresses '),
                        SizedBox(
                          height: 8.h,
                        ),
                        ...addresses
                            .map(
                              (e) => Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: AppTextField(
                                  initialValue: e.address,
                                  readOnly: true,
                                  onTap: () => _addAlternativeAddress(context,
                                      address: e),
                                  hintText: e.address,
                                  suffixIcon: Image.asset(
                                    AppImages.plusIcon,
                                    scale: 2,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        SizedBox(
                          height: 16.h,
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
                  onPressed: onContinue,
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
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
}
