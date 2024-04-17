import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/utils/enums.dart';

class PaymentMethodDialog extends StatelessWidget {
  const PaymentMethodDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(AppConstants.padding.horizontal),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: context.theme.scaffoldBackgroundColor,
          ),
          height: 676.h,
          width: 345.w,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Image.asset(
                          //   AppImages.successIcon,
                          //   scale: 2,
                          // ),
                          // GestureDetector(
                          //   onTap: () => context.pop(),
                          //   child: Image.asset(
                          //     AppImages.closeIcon,
                          //     scale: 2,
                          //   ),
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "Payment Method",
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleMedium?.copyWith(
                            // color: AppColors.blackColor.$500,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "Select your preferred payment method",
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.slateGreen,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      InkWell(
                        onTap: () => context.pop(PaymentMethod.transfer),
                        child: Container(
                          height: 136.h,
                          width: 322.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 16.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppConstants.borderRadius.medium),
                            border: Border.all(
                                color: AppColors.cardStrokeColor, width: 2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pay with transfer",
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(color: AppColors.slateGrey),
                              ),
                              Text(
                                "UNITED BANK FOR AFRICA",
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "KULAHQ",
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(color: Colors.black),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "4938375892",
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(
                                            color: AppColors.primaryColor),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Image.asset(
                                    AppImages.copyIconSmall,
                                    scale: 2,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      InkWell(
                        onTap: () => context.pop(PaymentMethod.card),
                        child: Container(
                          height: 72.h,
                          width: 322.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 20.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppConstants.borderRadius.medium),
                            border: Border.all(
                                color: AppColors.cardStrokeColor, width: 2),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pay with card",
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: AppColors.slateGrey,
                                ),
                              ),
                              Image.asset(
                                AppImages.creditCardIcon,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      InkWell(
                        onTap: () => context.pop(PaymentMethod.storeCredit),
                        child: Container(
                          height: 72.h,
                          width: 322.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 20.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppConstants.borderRadius.medium),
                            border: Border.all(
                                color: AppColors.cardStrokeColor, width: 2),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Pay from app",
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: AppColors.slateGrey,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Container(
                                color: AppColors.greenLight,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 4.h),
                                child: Text(
                                  "5% discount",
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    color: AppColors.green,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                AppImages.appIconSmall,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 5,
                    right: 0,
                    child: IconButton(
                        onPressed: () => AppRouter.router.pop(),
                        icon: const Icon(Icons.close)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
