import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/order_cubit/order_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/utils/amount_formatter.dart';

import 'components/order_detail_card.dart';

class OrderDetailsView extends StatelessWidget {
  final Order order;
  const OrderDetailsView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        title: "Order",
      ),
      body: Stack(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
                height: constraints.maxHeight / 1.34,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.padding.horizontal),
                  child: Column(
                      children: List.generate(
                          order.orderItems.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: OrderDetailCard(
                                  data: order.orderItems[index],
                                ),
                              ))),
                ));
          }),
          _buildDeliveryDetails()
        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDeliveryDetails() {
    return DraggableScrollableSheet(
        initialChildSize: 0.25,
        minChildSize: 0.25,
        builder: ((context, scrollController) {
          return Container(
            color: Colors.white,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.padding.horizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "Delivery",
                      style: context.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                      readOnly: true,
                      initialValue: order.deliveryAddress,
                      // backgroundColor: AppColors.disabledColor,
                      fieldTitle: "Address",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                      readOnly: true,
                      onTap: () {
                        Container(
                          padding: const EdgeInsets.all(13),
                          margin: EdgeInsets.symmetric(
                              horizontal: AppConstants.padding.horizontal),
                          constraints: const BoxConstraints(
                              maxWidth: 353, minHeight: 158),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadius.large)),
                          height: 100,
                          child: Text(
                            order.additionalInformation ?? "N/A",
                            style: context.textTheme.bodyLarge
                                ?.copyWith(fontSize: 15),
                          ),
                        ).asBottomSheet(context,
                            barrierColor: Colors.black.withOpacity(0.8),
                            backgroundColor: Colors.transparent);
                      },
                      fieldTitle: "Extra delivery instructions",
                      initialValue: order.additionalInformation ?? "N/A",
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "Fees",
                      style: context.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    ...[
                      ("Meal Price", amountFormatter(order.totalPrice), null),
                      ("Delivery Fee", "N/A", null),
                      ("Service fee", amountFormatter(order.serviceFee), null),
                      ("Vat fee", amountFormatter(order.vatFee), null),
                      ("Total", amountFormatter(order.totalAmount), null)
                    ].map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                e.$1,
                                style: context.textTheme.bodyLarge?.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Text(
                                  e.$2,
                                  textAlign: TextAlign.right,
                                  style: context.textTheme.bodyLarge?.copyWith(
                                      color: AppColors.greyTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
