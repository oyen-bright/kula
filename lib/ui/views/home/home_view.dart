import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/address_cubit/address_cubit.dart';
import 'package:kula/cubits/cart_cubit/cart_cubit.dart';
import 'package:kula/cubits/order_cubit/order_cubit.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/mixins/location.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/services/location_service.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/ui/components/widgets/refresh_indicator.dart';
import 'package:kula/utils/enums.dart';

import 'components/app_bar.dart';
import 'components/search_bar.dart';
import 'components/todays_specials.dart';
import 'components/vendors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with LocationMixin {
  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().getOrders();
    context.read<CartCubit>().getCart();
    checkLocationPermission();
    shouldAddAddress();
  }

  bool hasLocationPermission = false;

  void checkLocationPermission() async {
    final response = await requestLocationPermission(context);
    hasLocationPermission = response;

    if (mounted && context.mounted) {
      if (hasLocationPermission) {
        context.read<LocationService>().getCurrentLocation().then((res) {
          if (res.error != null) {
            context.showSnackBar(res.error, BarType.error);
            return;
          }

          if (res.position != null) {
            context.read<RestaurantCubit>().getRestaurants();
          }
        });
      }
      setState(() {});
    }
  }

  void shouldAddAddress() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<AddressCubit>().state.isEmpty) {
        AppRouter.router.push(AppRoutes.addAddress);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<OrderCubit>().getOrders();

    return Scaffold(
      body: !hasLocationPermission
          ? _buildLocationPermissionNotAvailable(context)
          : BlocConsumer<RestaurantCubit, RestaurantState>(
              listener: (context, state) {
                state.mapOrNull(
                    error: (state) => context.showSnackBar(state.error));
              },
              builder: (context, state) {
                return state.maybeMap(
                  loaded: (state) {
                    if (state.restaurants.isEmpty) {
                      return _buildNoRestaurantNearYou(context);
                    }
                    return _buildHomeView();
                  },
                  orElse: () => _buildHomeView(),
                );
              },
            ),
    );
  }

  SafeArea _buildHomeView() {
    return SafeArea(
      child: AppRefreshIndicator(
        onRefresh: context.read<RestaurantCubit>().getRestaurants,
        child: CustomScrollView(
          slivers: [
            const HomeAppBar(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  const HomeSearchBar().withHorViewPadding,
                  SizedBox(
                    height: 24.h,
                  ),
                  const TodaySpecials(),
                  SizedBox(
                    height: 23.h,
                  ),
                  const Vendors()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Center _buildLocationPermissionNotAvailable(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error,
            color: AppColors.primaryColor,
            size: 100,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Location Permission Required",
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Please enable location permission on att in other to continue ot user this app ",
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
          ),
          TextButton(
              onPressed: () async {
                await requestLocationPermission(context, shouldRequest: true);
                checkLocationPermission();
              },
              child: const Text("Enable"))
        ],
      ).withHorViewPadding,
    );
  }

  Center _buildNoRestaurantNearYou(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error,
            color: AppColors.primaryColor,
            size: 100,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "No Restaurants",
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "No restaurants within a 200000 kilo-meter radius of your location",
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge,
          ),
          TextButton(
              onPressed: context.read<RestaurantCubit>().getRestaurants,
              child: const Text("Retry"))
        ],
      ).withHorViewPadding,
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget Function(double shrinkOffset) childBuilder;

  PersistentHeader(this.childBuilder);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return childBuilder(shrinkOffset);
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
