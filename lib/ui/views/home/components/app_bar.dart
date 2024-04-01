import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/address_cubit/address_cubit.dart';
import 'package:kula/cubits/user_cubit/user_cubit.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/widgets/shimmer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      collapsedHeight: 60,
      toolbarHeight: 60,
      floating: true,
      snap: true,
      actions: [
        IconButton(
            visualDensity: VisualDensity.compact,
            alignment: Alignment.topCenter,
            onPressed: () {},
            icon: Image.asset(
              AppImages.notificationIcon,
              scale: 2,
            )),
        const SizedBox(
          width: 5,
        )
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return Text(
                "${state.user?.firstName} ${state.user?.lastName}",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              );
            },
          ),
          SizedBox(
            height: 6.h,
          ),
          InkWell(
            onTap: () => AppRouter.router.push(AppRoutes.changeLocation),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.locationIcon,
                  scale: 2,
                ),
                const SizedBox(
                  width: 4,
                ),
                BlocBuilder<AddressCubit, AddressState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                        loaded: (addresses) {
                          final defaultAddress = addresses
                              .where((element) => element.isDefault)
                              .firstOrNull;

                          if (defaultAddress == null) {
                            return const Text("No Address....",
                                style: TextStyle(fontSize: 14));
                          }

                          return AutoSizeText(
                              "${defaultAddress.getFormattedAddress}....",
                              style: const TextStyle(fontSize: 14));
                        },
                        orElse: () => const AppShimmer(
                              child: Text("No Address....",
                                  style: TextStyle(fontSize: 14)),
                            ));
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
        ],
      ),
    );
  }
}
