import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';

class OrderSentDialog extends StatelessWidget {
  const OrderSentDialog({
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
          height: 402.h,
          width: 345.w,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                      Image.asset(
                        AppImages.orderSentIcon,
                        scale: 2,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        "Order sent!",
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
                        "You will receive your package soon. Please, your order via the orders page",
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.slateGreen,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      const Spacer(),
                      AppElevatedButton(
                        elevation: 0,
                        title: "Check orders",
                        onPressed: () {},
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
