import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/order_cubit/order_cubit.dart';
import 'package:kula/cubits/order_cubit/order_model.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/ui/components/widgets/refresh_indicator.dart';
import 'package:kula/ui/components/widgets/shimmer.dart';
import 'package:kula/ui/views/orders/components/order_meal_card.dart';

import '../../../config/app_routes.dart';

class OrderPending extends StatelessWidget {
  const OrderPending({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return state.maybeMap(
            loaded: (state) => loadedWidget(context, state.orders.pending),
            orElse: () => loadingWidget());
      },
    );
  }

  Widget loadingWidget() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: AppConstants.padding.horizontal,
      ),
      separatorBuilder: (_, __) => SizedBox(
        height: 10.h,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return AppShimmer(
          child: OrderCard(
            order: Order.dummy,
          ).animate(effects: [FadeEffect(duration: 500.ms)]),
        );
      },
    );
  }

  Widget loadedWidget(BuildContext context, List<Order> orders) {
    return AppRefreshIndicator(
      onRefresh: context.read<OrderCubit>().getOrders,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: AppConstants.padding.horizontal,
        ),
        separatorBuilder: (_, __) => SizedBox(
          height: 10.h,
        ),
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderCard(
            onPressed: () => AppRouter.router
                .push(AppRoutes.orderDetails, extra: orders[index]),
            order: orders[index],
          ).animate(effects: [FadeEffect(duration: 500.ms)]);
        },
      ),
    );
  }
}
