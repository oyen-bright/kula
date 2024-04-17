import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142.h,
      padding: EdgeInsets.all(8.r),
      constraints: const BoxConstraints(
        minHeight: 140,
        maxHeight: 142,
        maxWidth: 353,
      ),
      decoration: BoxDecoration(
          // color: AppColors.cardColor,
          border: Border.all(color: AppColors.cardStrokeColor, width: 2),
          borderRadius:
              BorderRadius.circular(AppConstants.borderRadius.medium)),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [_buildOrderInfo(context), _buildStoreName(context)],
          ),
          _buildOrderTimePrice(context)
        ],
      ),
    );
  }

  Row _buildStoreName(BuildContext context) {
    return Row(
      children: [
        Text(
          "Gwarimpa",
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.greyTextColor,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Row _buildOrderInfo(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: AutoSizeText(
            "Chukas buka",
            maxLines: 1,
            style: context.textTheme.bodyLarge?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        TextButton(
            style: TextButton.styleFrom(
                foregroundColor: context.colorScheme.onSecondary,
                visualDensity: VisualDensity.compact,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: const EdgeInsets.only(left: 5)),
            onPressed: () {
              AppRouter.router.push(AppRoutes.orderDetails);
            },
            child: Row(
              children: [
                const Text("View Detailed Order "),
                Image.asset(
                  AppImages.forwardIcon,
                  scale: 2,
                ),
              ],
            ))
      ],
    );
  }

  Row _buildOrderTimePrice(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Image.asset(
                AppImages.timeIcon,
                scale: 1.8,
              ),
              SizedBox(
                width: 3.w,
              ),
              Expanded(
                child: Text(
                  "50-55 minutes",
                  maxLines: 1,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: AppColors.greyTextColor),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
          decoration: BoxDecoration(
              color: AppColors.tertiaryColor,
              borderRadius:
                  BorderRadius.circular(AppConstants.borderRadius.small)),
          child: AutoSizeText(
            "₦40,000",
            maxLines: 1,
            style: context.textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
