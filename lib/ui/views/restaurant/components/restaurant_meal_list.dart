import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kula/themes/app_colors.dart';

class RestaurantMealList extends StatelessWidget {
  const RestaurantMealList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Container(
            width: 48.w,
            height: 6.h,
            color: AppColors.inputFieldHintTextColor,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                padding: EdgeInsets.zero,
                style:
                    IconButton.styleFrom(visualDensity: VisualDensity.compact),
                onPressed: () => context.pop(),
                icon: const Icon(Icons.close)),
          ),
          SingleChildScrollView(
            child: Column(
                children:
                    List.generate(19, (index) => const Text("Pounded yam"))),
          )
        ],
      ),
    );
  }
}
