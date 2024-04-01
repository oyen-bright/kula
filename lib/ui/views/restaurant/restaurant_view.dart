import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

import 'components/restaurant_header.dart';
import 'components/restaurant_meal_info.dart';

class RestaurantView extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantView({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            RestaurantHeader(
              restaurant: restaurant,
            ),
            Container(
              height: 48.h,
              margin: EdgeInsets.symmetric(
                  horizontal: AppConstants.padding.horizontal),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.openIcon,
                    scale: 2,
                  ),
                  Expanded(
                      child: Text(
                    "Open from 8:45am - 9:55pm",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ))
                ],
              ),
            ),
            AppTextField(
                keyboardType: TextInputType.none,
                hintColor: const Color.fromARGB(255, 170, 174, 184),
                hintText: "Search for a meal",
                suffixIcon: Image.asset(
                  AppImages.searchIcon,
                  scale: 2,
                )).withHorViewPadding,
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const Column(
                children: [RestaurantMealCard()],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
