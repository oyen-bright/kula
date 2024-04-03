import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/restaurant_cubit/meal_model.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/ui/components/widgets/shimmer.dart';

import 'specials_card.dart';

class TodaySpecials extends StatelessWidget {
  const TodaySpecials({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        return state.maybeMap(
            orElse: () => AppShimmer(
                child: _buildBody(
                    context, List.generate(5, (_) => Meal.dummy), true)),
            loaded: (state) => _buildBody(context, state.todaySpecials));
      },
    );
  }

  Column _buildBody(BuildContext context, List<Meal> todaySpecial,
      [bool isDummy = false]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "Today’s Special",
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ).withHorViewPadding,
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 187.h,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 8.w,
            ),
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding.horizontal),
            shrinkWrap: true,
            itemCount: todaySpecial.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return SpecialMealCard(
                onTap: !isDummy ? () {} : null,
                meal: todaySpecial[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
