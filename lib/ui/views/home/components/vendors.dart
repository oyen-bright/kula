import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/ui/components/widgets/shimmer.dart';

import 'vendors_card.dart';

class Vendors extends StatelessWidget {
  const Vendors({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        return state.maybeMap(
            orElse: () => AppShimmer(child: _buildBody(context)),
            loaded: (state) => _buildBody(context));
      },
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "Vendors",
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ).withHorViewPadding,
        SizedBox(
          height: 8.h,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
          separatorBuilder: (_, __) => SizedBox(
            height: 8.h,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const VendorsCard();
          },
        ),
      ],
    );
  }
}
