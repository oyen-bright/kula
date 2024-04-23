// ignore_for_file: public_member_api_docs, sort_constructors_first
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
import 'components/order_drop_down.dart';

class OrderPending extends StatefulWidget {
  const OrderPending({super.key});

  @override
  State<OrderPending> createState() => _OrderPendingState();
}

class _OrderPendingState extends State<OrderPending> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return state.maybeMap(
            loaded: (state) => LoadedState(orders: state.orders.pending),
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
}

class LoadedState extends StatefulWidget {
  final List<Order> orders;
  const LoadedState({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  State<LoadedState> createState() => _LoadedStateState();
}

class _LoadedStateState extends State<LoadedState> {
  String? selectedOption;
  List<Order> filteredList = [];
  @override
  void initState() {
    setState(() {
      filteredList = widget.orders;
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      selectedOption = null;
    });
    super.didChangeDependencies();
  }

  void onFilter() {
    if (selectedOption == null) {
      setState(() {
        filteredList = widget.orders;
      });
      return;
    }
    setState(() {
      filteredList = widget.orders
          .where((element) =>
              element.status.toLowerCase() == selectedOption?.toLowerCase())
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 4, horizontal: AppConstants.padding.horizontal),
          child: OrderTypeDropdown(
            onChanged: (selected) {
              selectedOption = selected;
              onFilter();
            },
            selectedOrderType: selectedOption,
          ),
        ).animate(effects: [const FadeEffect()]),
        Expanded(
          child: AppRefreshIndicator(
            onRefresh: context.read<OrderCubit>().getOrders,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: AppConstants.padding.horizontal,
              ),
              separatorBuilder: (_, __) => SizedBox(
                height: 10.h,
              ),
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                return OrderCard(
                  onPressed: () => AppRouter.router
                      .push(AppRoutes.orderDetails, extra: filteredList[index]),
                  order: filteredList[index],
                ).animate(effects: [FadeEffect(duration: 500.ms)]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
