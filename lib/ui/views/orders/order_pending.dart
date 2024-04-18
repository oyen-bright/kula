import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/order_cubit/order_cubit.dart';
import 'package:kula/ui/components/widgets/shimmer.dart';
import 'package:kula/ui/views/orders/components/order_meal_card.dart';

class OrderPending extends StatelessWidget {
  const OrderPending({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return state.maybeMap(orElse: () => loadingWidget());
      },
    );

    ListView.separated(
      padding: EdgeInsets.symmetric(
        //TODO; view paddeing
        vertical: 10,
        horizontal: AppConstants.padding.horizontal,
      ),
      separatorBuilder: (_, __) => SizedBox(
        height: 10.h,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const OrderCard()
            .animate(effects: [FadeEffect(duration: 500.ms)]);
      },
    );
  }

  Widget loadingWidget() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        //TODO; view paddeing
        vertical: 10,
        horizontal: AppConstants.padding.horizontal,
      ),
      separatorBuilder: (_, __) => SizedBox(
        height: 10.h,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return AppShimmer(
          child: const OrderCard()
              .animate(effects: [FadeEffect(duration: 500.ms)]),
        );
      },
    );
  }
}
