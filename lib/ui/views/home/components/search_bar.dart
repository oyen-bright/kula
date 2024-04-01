import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_cubit.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/components/widgets/shimmer.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        return state.maybeMap(
            orElse: () => AppShimmer(child: _buildBody(context)),
            loaded: (state) => _buildBody(context));
      },
    );
  }

  AppTextField _buildBody(BuildContext context) {
    return AppTextField(
        readOnly: true,
        keyboardType: TextInputType.none,
        onTap: () => AppRouter.router.push(AppRoutes.search),
        hintColor: const Color.fromARGB(255, 170, 174, 184),
        hintText: "Search for a restaurant or meal",
        suffixIcon: Image.asset(
          AppImages.searchIcon,
          scale: 2,
        ));
  }
}
