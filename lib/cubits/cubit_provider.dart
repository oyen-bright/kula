import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kula/cubits/address_cubit/address_cubit.dart';
import 'package:kula/cubits/auth_cubit/auth_cubit.dart';
import 'package:kula/cubits/cart_cubit/cart_cubit.dart';
import 'package:kula/cubits/order_cubit/order_cubit.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_cubit.dart';
import 'package:kula/cubits/user_cubit/user_cubit.dart';
import 'package:kula/services/address_service.dart';
import 'package:kula/services/auth_service.dart';
import 'package:kula/services/cart_service.dart';
import 'package:kula/services/location_service.dart';
import 'package:kula/services/order_service.dart';
import 'package:kula/services/otp_service.dart';
import 'package:kula/services/resturant_service.dart';

import 'loading_cubit/loading_cubit.dart';

class AppCubitProvider extends StatelessWidget {
  final Widget child;
  const AppCubitProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoadingCubit>(
          create: (context) => LoadingCubit(),
        ),
        BlocProvider<AddressCubit>(
          create: (context) => AddressCubit(
              context.read<AddressService>(), context.read<LoadingCubit>()),
        ),
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
              context.read<AuthService>(),
              context.read<OTPService>(),
              context.read<LoadingCubit>(),
              context.read<UserCubit>(),
              context.read<AddressCubit>()),
        ),
        BlocProvider<RestaurantCubit>(
            create: (context) => RestaurantCubit(
                context.read<RestaurantService>(),
                context.read<LocationService>())),
        BlocProvider<OrderCubit>(
            create: (context) => OrderCubit(context.read<OrderService>())),
        BlocProvider<CartCubit>(
            create: (context) => CartCubit(
                context.read<LoadingCubit>(), context.read<CartService>())),
      ],
      child: child,
    );
  }
}
