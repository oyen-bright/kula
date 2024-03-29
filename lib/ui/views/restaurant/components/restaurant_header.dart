import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';

class RestaurantHeader extends StatelessWidget {
  const RestaurantHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393.w,
      height: 120.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://plus.unsplash.com/premium_photo-1663047707111-c022dee3abe7?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWVhbHxlbnwwfHwwfHx8MA%3D%3D"))),
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: Colors.black.withOpacity(0.7),
          )),
          Positioned.fill(
              child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding.horizontal, vertical: 12.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => context.pop(),
                        icon: Image.asset(
                          AppImages.roundBackButton,
                          scale: 2,
                        )),
                    Text(
                      "Chuks Buka",
                      style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.milkyWhite),
                    ),
                    Row(
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
                              color: AppColors.milkyWhite,
                              decoration: TextDecoration.underline),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
                // const Spacer(),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'delivery cost\n',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                              text: '₦1,500',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.inputFieldHintTextColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        thickness: 1.1,
                        color: Colors.white,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'Wait time\n',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                              text: '30-45 mins',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.inputFieldHintTextColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        thickness: 1.1,
                        color: Colors.white,
                      ),
                      TextButton(
                          onPressed: () {
                            AppRouter.router.push(AppRoutes.restaurantReview);
                          },
                          child: const Text(
                            "More Details >",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class RestaurantHeaderMeal extends StatelessWidget {
  const RestaurantHeaderMeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393.w,
      height: 120.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://plus.unsplash.com/premium_photo-1663047707111-c022dee3abe7?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWVhbHxlbnwwfHwwfHx8MA%3D%3D"))),
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: Colors.black.withOpacity(0.7),
          )),
          Positioned.fill(
              child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding.horizontal, vertical: 12.h),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => context.pop(),
                      icon: Image.asset(
                        AppImages.roundBackButton,
                        scale: 2,
                      )),
                  const Spacer(),
                ]),
          )),
          Positioned.fill(
              child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding.horizontal, vertical: 12.h),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  "Chuks Buka",
                  style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.milkyWhite),
                ),
                const Spacer(
                  flex: 2,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                  decoration: BoxDecoration(
                      color: AppColors.tertiaryColor,
                      borderRadius: BorderRadius.circular(
                          AppConstants.borderRadius.small)),
                  child: AutoSizeText(
                    "₦40,000",
                    maxLines: 1,
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: Colors.black),
                  ),
                ),
                const Spacer(),
                // const Spacer(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
