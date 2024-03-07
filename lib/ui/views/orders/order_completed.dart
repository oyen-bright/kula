import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/ui/views/orders/components/order_meal_card.dart';

class OrderCompleted extends StatelessWidget {
  const OrderCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        //TOdo:sdkfdsfdjssfdjfkdsjsdf
        vertical: 10,
        horizontal: AppConstants.padding.horizontal,
      ),
      separatorBuilder: (_, __) => SizedBox(
        height: 10.h,
      ),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return const OrderCard()
            .animate(effects: [FadeEffect(duration: 500.milliseconds)]);
      },
    );
  }
}
