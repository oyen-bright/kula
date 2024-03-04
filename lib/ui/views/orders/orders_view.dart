import 'package:flutter/material.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/views/orders/order_completed.dart';

import 'order_pending.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ViewAppBar(
          toolbarHeight: 100,
          title: "Orders",
          bottom: const TabBar(tabs: [
            Tab(
              text: "Pending orders",
            ),
            Tab(
              text: "Completed orders",
            )
          ]),
        ),
        body: const TabBarView(
          children: [OrderPending(), OrderCompleted()],
        ),
      ),
    );
  }
}
