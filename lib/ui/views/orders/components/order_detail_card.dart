import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/order_cubit/order_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/utils/amount_formatter.dart';

class OrderDetailCard extends StatelessWidget {
  final OrderItem data;
  const OrderDetailCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142.h,
      alignment: Alignment.center,
      padding: EdgeInsets.all(15.r),
      constraints: const BoxConstraints(
        minHeight: 140,
        maxHeight: 142,
        maxWidth: 363,
      ),
      decoration: BoxDecoration(
          color: AppColors.cardColor,
          border: Border.all(color: AppColors.cardStrokeColor, width: 2),
          borderRadius:
              BorderRadius.circular(AppConstants.borderRadius.medium)),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 84,
            height: double.infinity,
            decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadius.medium),
                border: Border.all(color: AppColors.lightGreyColor)),
            child: Image.network(data.meal.image, fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                data.meal.name,
                maxLines: 1,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: AutoSizeText(
                  data.meal.description,
                  maxLines: 2,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.greyTextColor,
                    fontSize: 15,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                decoration: BoxDecoration(
                    color: AppColors.tertiaryColor,
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius.small)),
                child: AutoSizeText(
                  amountFormatter(data.totalAmount),
                  maxLines: 1,
                  style: context.textTheme.bodyMedium,
                ),
              ),
              Row(
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
                            data.meal.estimatedTime,
                            maxLines: 1,
                            style: context.textTheme.bodyMedium
                                ?.copyWith(color: AppColors.greyTextColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.offWhiteColor,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: AppColors.cardStrokeColor, width: 2)),
                    child: Text(
                      data.quantity.toString(),
                      style: context.textTheme.titleMedium,
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
