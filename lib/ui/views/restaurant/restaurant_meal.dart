import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/views/restaurant/components/restaurant_header.dart';

class RestaurantMeal extends StatelessWidget {
  const RestaurantMeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const RestaurantHeaderMeal(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppConstants.padding.horizontal),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "Pounded yam",
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.",
                        style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyTextColor),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Text(
                        "Add extra",
                        style: context.textTheme.bodyMedium?.copyWith(),
                      ),
                      ...List.generate(
                          10,
                          (x) => ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text("Pounded yam",
                                    style:
                                        context.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    )),
                                subtitle: Text("+ yam",
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: AppColors.greyTextColor)),
                                trailing: Container(
                                  width: 78.w,
                                  height: 29.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(48.r),
                                      border: Border.all(
                                          color: AppColors.offWhiteColor)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          child: Image.asset(
                                            AppImages.decreaseIcon,
                                            scale: 2,
                                          ),
                                        ),
                                      ),
                                      AutoSizeText(
                                        "1",
                                        style: context.textTheme.titleSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          child: Image.asset(
                                            AppImages.increaseIcon,
                                            scale: 2,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 393.w,
              height: 118.h,
              // margin: EdgeInsets.only(bottom: 34.h),
              padding: EdgeInsets.symmetric(
                  vertical: 16.h, horizontal: AppConstants.padding.horizontal),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: context.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(16.r),
                            border:
                                Border.all(color: context.colorScheme.primary)),
                        width: 48.w,
                        height: 48.w,
                        alignment: Alignment.center,
                        child: Text(
                          "1",
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 185.w,
                        height: 48.h,
                        child: AppElevatedButton(
                          elevation: 0,
                          title: "Add ₦1,395.00",
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                  const Spacer()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
