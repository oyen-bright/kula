import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

import 'components/order_detail_card.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

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
                          10,
                          (index) => const Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: OrderDetailCard(),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Delivery",
                      style: context.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      backgroundColor: AppColors.disabledColor,
                      fieldTitle: "Address",
                      hintText: "Plot 2393 Kabi drive, benue",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
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
                            "Once you get to the house, meet the gateman and tell him you are looking for James John. He will open the door for you. Come to apartment 11.",
                            style: context.textTheme.bodyLarge
                                ?.copyWith(fontSize: 15),
                          ),
                        ).asBottomSheet(context,
                            barrierColor: Colors.black.withOpacity(0.8),
                            backgroundColor: Colors.transparent);
                      },
                      fieldTitle: "Extra delivery instructions",
                      hintText:
                          "Once you get to the house, meet the gateman...",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Fees",
                      style: context.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ...[
                      ("Meal Price", "₦12,000.00", null),
                      ("Delivery Fee", "₦1,200.00", null),
                      ("Service fee", "₦240 (2%)", null),
                      ("Total", "₦13,440.00", null)
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
