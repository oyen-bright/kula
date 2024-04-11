import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';
import 'package:kula/themes/app_colors.dart';

class RestaurantMealList extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantMealList({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          height: 16.h,
        ),
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: IconButton(
        //       padding: EdgeInsets.zero,
        //       style: IconButton.styleFrom(visualDensity: VisualDensity.compact),
        //       onPressed: () => context.pop(),
        //       icon: const Icon(Icons.close)),
        // ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                    restaurant.meals?.length ?? 0,
                    (index) => ListTile(
                        onTap: () {
                          context.pop(restaurant.meals?[index].id);
                        },
                        title: Text(restaurant.meals?[index].name ?? "")))),
          ),
        )
      ],
    );
  }
}
