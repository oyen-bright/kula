import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/address_cubit/address_cubit.dart';
import 'package:kula/cubits/address_cubit/address_model.dart';
import 'package:kula/cubits/cart_cubit/cart_cubit.dart';
import 'package:kula/cubits/cart_cubit/cart_model.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/cubits/user_cubit/user_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/services/cart_service.dart';
import 'package:kula/services/payment_service.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/buttons/elevated_button.dart';
import 'package:kula/ui/components/dialgos/order_sent_dialog.dart';
import 'package:kula/ui/components/dialgos/payment_method_dialog.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/components/widgets/refresh_indicator.dart';
import 'package:kula/ui/components/widgets/shimmer.dart';
import 'package:kula/ui/views/cart/components/cart_item_card.dart';
import 'package:kula/utils/amount_formatter.dart';
import 'package:kula/utils/enums.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late final DraggableScrollableController controller;

  @override
  void initState() {
    context.read<CartCubit>().getCart();

    super.initState();
    controller = DraggableScrollableController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        state.mapOrNull(message: (value) => context.showSnackBar(value.error));
      },
      child: Scaffold(
        appBar: ViewAppBar(
          title: "Checkout",
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Stack(
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  return SizedBox(
                      height: constraints.maxHeight / 1.1,
                      child: AppRefreshIndicator(
                        onRefresh: context.read<CartCubit>().getCart,
                        child: state.maybeMap(
                            hasItem: (_) => _buildCart(state.cartItems ?? []),
                            message: (_) => _buildCart(state.cartItems ?? []),
                            orElse: () => _buildLoadingCart()),
                      ));
                }),
                if (!state.isEmpty) const OrderDetails()
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCart(List<CartItem> items) {
    if (items.isEmpty) {
      return _buildEmptyCart();
    }

    return ListView.builder(
      padding:
          EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CartItemCard(
            onDecrease: () => context.read<CartCubit>().decrease(items[index]),
            onIncrease: () => context.read<CartCubit>().inCrease(items[index]),
            onDelete: () => context
                .read<CartCubit>()
                .deleteCartItem(items[index].cartItemId),
            cartItem: items[index],
          ),
        );
      },
    );
  }

  Widget _buildLoadingCart() {
    return ListView.builder(
        padding:
            EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: AppShimmer(
                child: CartItemCard(
              cartItem: CartItem.dummy,
            )),
          );
        });
  }

  Center _buildEmptyCart() {
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
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
  }

  void revealOrder() {
    controller
        .animateTo(0.1, duration: 1.seconds, curve: Curves.fastOutSlowIn)
        .then((value) => reviewOrder = false);
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
                      child: BlocBuilder<AddressCubit, AddressState>(
                        builder: (context, addressState) {
                          return BlocConsumer<CartCubit, CartState>(
                            builder: (context, state) {
                              return state.maybeMap(
                                  hasItem: (_) => _buildOrderDetails(
                                      context,
                                      state.fees ?? CartFees.dummy,
                                      addressState.selectedAddress),
                                  message: (_) => _buildOrderDetails(
                                      context,
                                      state.fees ?? CartFees.dummy,
                                      addressState.selectedAddress),
                                  orElse: () => AppShimmer(
                                      child: _buildOrderDetails(
                                          context,
                                          CartFees.dummy,
                                          addressState.selectedAddress)));
                            },
                            listener: (BuildContext context, CartState state) {
                              state.mapOrNull(
                                  loading: (_) =>
                                      reviewOrder ? revealOrder() : null);
                            },
                          );
                        },
                      ))));
        }));
  }

  Widget _buildOrderDetails(
      BuildContext cx, CartFees cartFees, Address? address) {
    onCompeteOrder() async {
      if (address == null) {
        context.showSnackBar(
            "Please add a delivery address",
            BarType.action,
            SnackBarAction(
                label: "Add Address",
                onPressed: () => AppRouter.router
                    .go(AppRoutes.profileManageAddress, extra: true)));
        return;
      }

      await (const PaymentMethodDialog().asDialog<PaymentMethod>(context))
          .then((res) async {
        if (res == null || !mounted) {
          return;
        }

        context.read<LoadingCubit>().loading(message: "Creating Order");

        final createOrderResponse = await context
            .read<CartService>()
            .createOrder(res, cartFees.total.toString());

        if (!mounted || !context.mounted) {
          return;
        }
        context.read<LoadingCubit>().loaded();

        if (createOrderResponse.error != null) {
          context.showSnackBar(createOrderResponse.error);
          return;
        }

        if (res == PaymentMethod.storeCredit) {
          context.showSnackBar(createOrderResponse.data?.$1);
          return;
        }
        context.read<LoadingCubit>().loading(message: "Payment");

        final paymentResponse = await context
            .read<PaymentService>()
            .makePayment(
                context,
                cartFees.total.toString(),
                context.read<UserCubit>().state.user!,
                createOrderResponse.data!.$2);

        if (!mounted || !context.mounted) {
          return;
        }

        context.read<LoadingCubit>().loaded();

        if (paymentResponse.error != null) {
          context.showSnackBar(paymentResponse.error);
          return;
        }

        if (paymentResponse.data == null) {
          return;
        }
        context.showSnackBar(paymentResponse.data);

        const OrderSentDialog().asDialog(context);

        //TODO:"remove clear cart"
        context.read<CartCubit>().clearCart();
        // context.read<CartCubit>().getCart();

        return;
      });
    }

    return Column(
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
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    visualDensity: VisualDensity.compact,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                onPressed: () {
                  !reviewOrder ? controller.reset() : revealOrder();
                },
                child: Text(reviewOrder ? "Preview Order" : "Review Order"))
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        AppTextField(
          // backgroundColor: AppColors.disabledColor,
          fieldTitle: "Address",
          readOnly: true,
          controller: TextEditingController(
              text: address?.getFormattedAddress ?? "Not Available"),
          onTap: () => AppRouter.router.push(AppRoutes.changeLocation),
          suffixIcon: Image.asset(
            AppImages.editIcon,
            scale: 2,
            color: context.colorScheme.primary,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        AppTextField(
          readOnly: true,
          onTap: () {
            // AppRouter.router.push(AppRoutes.cartDeliveryInstruction);
          },
          controller: TextEditingController(
            text: address?.additionalInfo ?? "Not Available",
          ),
          fieldTitle: "Extra delivery instructions",
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
          ("Meal Price", amountFormatter(cartFees.totalMealCost)),
          ("Delivery Fee", amountFormatter(cartFees.deliveryFee)),
          (
            "Service fee",
            "${amountFormatter(cartFees.serviceFee)} (2%)",
          ),
          ("Total", amountFormatter(cartFees.total))
        ].map((e) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    e.$1,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
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
          onPressed: onCompeteOrder,
        ),
        SizedBox(
          height: 10.h,
        ),
        TextButton(
            onPressed: context.read<CartCubit>().clearCart,
            // const OrderSentDialog().asDialog(context);

            child: const Text(
              "Cancel order",
              style: TextStyle(color: AppColors.red),
            ))
      ],
    );
  }
}
