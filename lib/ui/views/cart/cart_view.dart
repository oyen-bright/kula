import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/dialgos/order_sent_dialog.dart';
import 'package:kula/ui/components/dialgos/payment_method_dialog.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/views/cart/components/cart_item_card.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late final DraggableScrollableController controller;

  @override
  void initState() {
    super.initState();
    controller = DraggableScrollableController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        title: "Checkout",
      ),
      body: Stack(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
                height: constraints.maxHeight / 1.1,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.padding.horizontal),
                  child: Column(
                      children: List.generate(
                          10,
                          (index) => const Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: CartItemCard(),
                              ))),
                ));
          }),
          const OrderDetails()
        ],
      ),
    );
  }

  Center _buildEmptyCart(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding:
            EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              AppImages.noItemCart,
              scale: 2,
            ),
            SizedBox(
                width: double.infinity,
                child: Text(
                  "Your cart is empty, place a yummy order today!",
                  style: context.textTheme.bodyLarge
                      ?.copyWith(color: AppColors.manatee),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: 16.h,
            ),
            AppElevatedButton(
              title: "Place an order",
              onPressed: () => AppRouter.router.go(AppRoutes.home),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderDetails extends StatefulWidget {
  const OrderDetails({
    super.key,
  });

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  late final DraggableScrollableController controller;

  bool reviewOrder = true;

  @override
  void initState() {
    super.initState();
    controller = DraggableScrollableController();
    controller.addListener(onScrollChange);
  }

  onScrollChange() {
    print(controller.size);
    if (controller.size < 1.0) {
      setState(() {
        reviewOrder = true;
      });
    }

    if (controller.size == 0.1) {
      setState(() {
        reviewOrder = false;
      });
    }
    print(reviewOrder);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.86,
        controller: controller,
        minChildSize: 0.1,
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
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Delivery",
                            style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                visualDensity: VisualDensity.compact,
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap),
                            onPressed: () {
                              !reviewOrder
                                  ? controller.reset()
                                  : controller
                                      .animateTo(0.1,
                                          duration: 1.seconds,
                                          curve: Curves.fastOutSlowIn)
                                      .then((value) => reviewOrder = false);
                            },
                            child: Text(
                                reviewOrder ? "Preview Order" : "Review Order"))
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                      backgroundColor: AppColors.disabledColor,
                      fieldTitle: "Address",
                      suffixIcon: Image.asset(
                        AppImages.editIcon,
                        scale: 2,
                        color: context.colorScheme.primary,
                      ),
                      hintText: "Plot 2393 Kabi drive, benue",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                      readOnly: true,
                      onTap: () {
                        AppRouter.router
                            .push(AppRoutes.cartDeliveryInstruction);
                      },
                      fieldTitle: "Extra delivery instructions",
                      hintText:
                          "Once you get to the house, meet the gateman...",
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "Fees",
                      style: context.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    ...[
                      ("Meal Price", "₦12,000.00", null),
                      ("Delivery Fee", "₦1,200.00", null),
                      ("Service fee", "₦240 (2%)", null),
                      ("Total", "₦13,440.00", null)
                    ].map((e) => Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                e.$1,
                                style: context.textTheme.bodyLarge?.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Text(
                                  e.$2,
                                  textAlign: TextAlign.right,
                                  style: context.textTheme.bodyLarge?.copyWith(
                                      color: AppColors.greyTextColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    AppElevatedButton(
                      elevation: 0,
                      title: "Complete order",
                      onPressed: () {
                        const PaymentMethodDialog().asDialog(context);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextButton(
                        onPressed: () {
                          const OrderSentDialog().asDialog(context);
                        },
                        child: const Text(
                          "Cancel order",
                          style: TextStyle(color: AppColors.red),
                        ))
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
