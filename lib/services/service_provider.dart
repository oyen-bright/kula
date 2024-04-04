import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kula/services/address_service.dart';
import 'package:kula/services/auth_service.dart';
import 'package:kula/services/cart_service.dart';
import 'package:kula/services/location_service.dart';
import 'package:kula/services/otp_service.dart';
import 'package:kula/services/resturant_service.dart';

class RepositoriesProvider extends StatelessWidget {
  final Widget child;
  const RepositoriesProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthService>(
          lazy: true,
          create: (context) => AuthService(),
        ),
        RepositoryProvider<OTPService>(
          lazy: true,
          create: (context) => OTPService(),
        ),
        RepositoryProvider<AddressService>(
          lazy: true,
          create: (context) => AddressService(),
        ),
        RepositoryProvider<LocationService>(
          lazy: true,
          create: (context) => LocationService(),
        ),
        RepositoryProvider<RestaurantService>(
          lazy: true,
          create: (context) => RestaurantService(),
        ),
        RepositoryProvider<CartService>(
          lazy: true,
          create: (context) => CartService(),
        ),
      ],
      child: child,
    );
  }
}
