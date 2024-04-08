import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';

class WillPopWrapper extends StatelessWidget {
  final Widget child;

  const WillPopWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future(() => context.read<LoadingCubit>().state.map(
            initial: (_) => true,
            loading: (_) => false,
          )),
      child: child,
    );
  }
}
