import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kula/cubits/auth_cubit/auth_cubit.dart';
import 'package:kula/services/auth_service.dart';
import 'package:kula/services/otp_service.dart';

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
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(context.read<AuthService>(),
              context.read<OTPService>(), context.read<LoadingCubit>()),
        )
      ],
      child: child,
    );
  }
}
