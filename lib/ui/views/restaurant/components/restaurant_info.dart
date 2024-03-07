import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/themes/app_images.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              AutoSizeText(
                "Chukas buka",
                maxLines: 1,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      AppImages.starIcon,
                      scale: 2,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text.rich(
                      const TextSpan(
                        children: [
                          TextSpan(
                            text: '4.8 ',
                          ),
                          TextSpan(
                            text: '(74)',
                          ),
                        ],
                      ),
                      style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          decoration: TextDecoration.underline),
                      maxLines: 1,
                    ),
                  ],
                ),
              )
            ],
          ).withHorViewPadding,
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                AppImages.locationIcon,
                scale: 2,
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                  child: Text(
                "Location",
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
              ))
            ],
          ).withHorViewPadding,
          SizedBox(
            height: 8.h,
          ),
          AutoSizeText(
                  "No2 Adebowale street, off UBA rd Downtown Menlo park, kubwa, Abuja",
                  style: context.textTheme.bodyMedium?.copyWith(
                      decoration: TextDecoration.underline, fontSize: 14))
              .withHorViewPadding,
        ],
      ),
    );
  }
}
