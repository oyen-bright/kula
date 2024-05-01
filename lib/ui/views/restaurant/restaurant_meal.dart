import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/cart_cubit/add_to_cart_model.dart';
import 'package:kula/cubits/cart_cubit/cart_cubit.dart';
import 'package:kula/cubits/restaurant_cubit/meal_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/views/restaurant/components/restaurant_header.dart';
import 'package:kula/utils/amount_formatter.dart';

class RestaurantMeal extends StatefulWidget {
  final String restaurantId;
  final Meal meal;
  const RestaurantMeal(
      {super.key, required this.restaurantId, required this.meal});

  @override
  State<RestaurantMeal> createState() => _RestaurantMealState();
}

class _RestaurantMealState extends State<RestaurantMeal> {
  late AddToCartItem item = AddToCartItem(
      price: widget.meal.price,
      mealId: widget.meal.id,
      quantity: 1,
      mealVarieties: [],
      mealExtra: []);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        state.mapOrNull(
          message: (value) => context.showSnackBar(value.error),
        );
      },
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              RestaurantHeaderMeal(
                meal: widget.meal,
              ),
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
                          widget.meal.name,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          widget.meal.description,
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
                        if (widget.meal.showExtras)
                          ...List.generate(
                              widget.meal.mealExtra.length,
                              (index) => ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(
                                        widget.meal.mealExtra[index].mealName,
                                        style: context.textTheme.bodyMedium
                                            ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                        )),
                                    subtitle: Text(
                                        "+ ${amountFormatter(widget.meal.mealExtra[index].price)}",
                                        style: context.textTheme.bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color:
                                                    AppColors.greyTextColor)),
                                    trailing: Container(
                                      width: 78.w,
                                      height: 29.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(48.r),
                                          border: Border.all(
                                              color: AppColors.offWhiteColor)),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  item.decreaseExtraMealQuality(
                                                      widget.meal
                                                          .mealExtra[index].id);
                                                });
                                              },
                                              child: Image.asset(
                                                AppImages.decreaseIcon,
                                                scale: 2,
                                              ),
                                            ),
                                          ),
                                          AutoSizeText(
                                            item
                                                .mealExtraQuantity(widget
                                                    .meal.mealExtra[index].id)
                                                .toString(),
                                            style: context.textTheme.titleSmall
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  item.increaseExtraMealQuality(
                                                      widget.meal
                                                          .mealExtra[index].id,
                                                      double.parse(widget
                                                          .meal
                                                          .mealExtra[index]
                                                          .price));
                                                });
                                              },
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
                    vertical: 16.h,
                    horizontal: AppConstants.padding.horizontal),
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
                              border: Border.all(
                                  color: context.colorScheme.primary)),
                          width: 48.w,
                          height: 48.w,
                          alignment: Alignment.center,
                          child: Text(
                            item.itemQuantity.toString(),
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
                            title: "Add ${amountFormatter(item.itemPrice)}",
                            onPressed: () => context
                                .read<CartCubit>()
                                .addToCart(item, widget.restaurantId),
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
      ),
    );
  }
}
