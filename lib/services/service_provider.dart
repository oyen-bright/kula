import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kula/services/auth_service.dart';
import 'package:kula/services/otp_service.dart';

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
      ],
      child: child,
    );
  }
}
