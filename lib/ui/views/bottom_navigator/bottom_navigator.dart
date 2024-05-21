library app_bottom_navigator;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/cart_cubit/cart_cubit.dart';
import 'package:kula/data/http/http_client.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/utils/orientation_utils.dart';

part './components/bottom_navigator_icon.dart';
part 'constants/constants.dart';
part 'constants/strings.dart';

class AppBottomNavigator extends StatefulWidget {
  const AppBottomNavigator({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<AppBottomNavigator> createState() => _AppBottomNavigatorState();
}

class _AppBottomNavigatorState extends State<AppBottomNavigator> {
  @override
  void initState() {
    super.initState();
    HttpClient.expiredTokenStream.listen((hasExpired) {
      if (!hasExpired) {
        return;
      }

      _handelExpiredToken();
    });
    setPortraitOrientation();
  }

  @override
  void dispose() {
    resetPreferredOrientations();
    super.dispose();
  }

  void _handelExpiredToken() async {
    if (!mounted || !context.mounted) {
      return;
    }
    await showAdaptiveDialog(
        builder: (BuildContext context) => AlertDialog.adaptive(
                title: const Text('Session Expired'),
                content: const Text('Please login again to continue.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ]),
        context: context);
    AppRouter.router.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.child,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              height: 0.01,
              color: Colors.black.withOpacity(0.5),
            ),
            BottomNavigationBar(
              currentIndex: widget.child.currentIndex,
              onTap: (index) {
                widget.child.goBranch(
                  index,
                  initialLocation: index == widget.child.currentIndex,
                );
              },
              items: [
                const BottomNavigationBarItem(
                  icon: BottomNavigationIcon(
                    color: AppColors.inActiveBottomNavigationColor,
                    name: AppImages.homeIcon,
                  ),
                  activeIcon: BottomNavigationIcon(
                    name: AppImages.homeIcon,
                    color: AppColors.activeBottomNavigationColor,
                  ),
                  label: Strings.homeMenu,
                ),
                BottomNavigationBarItem(
                  icon: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return Badge(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        backgroundColor: AppColors.activeBottomNavigationColor,
                        offset: const Offset(10, 0),
                        isLabelVisible: state.cartItemCount != 0,
                        label: Text(state.cartItemCount.toString()),
                        child: const BottomNavigationIcon(
                          color: AppColors.inActiveBottomNavigationColor,
                          name: AppImages.cartIcon,
                        ),
                      );
                    },
                  ),
                  activeIcon: const BottomNavigationIcon(
                    color: AppColors.activeBottomNavigationColor,
                    name: AppImages.cartIcon,
                  ),
                  label: Strings.cartMenu,
                ),
                const BottomNavigationBarItem(
                  icon: BottomNavigationIcon(
                    color: AppColors.inActiveBottomNavigationColor,
                    name: AppImages.ordersIcon,
                  ),
                  activeIcon: BottomNavigationIcon(
                    name: AppImages.ordersIcon,
                    color: AppColors.activeBottomNavigationColor,
                  ),
                  label: Strings.ordersMenu,
                ),
                const BottomNavigationBarItem(
                  icon: BottomNavigationIcon(
                    color: AppColors.inActiveBottomNavigationColor,
                    name: AppImages.profileIcon,
                  ),
                  activeIcon: BottomNavigationIcon(
                    name: AppImages.profileIcon,
                    color: AppColors.activeBottomNavigationColor,
                  ),
                  label: Strings.profileMenu,
                ),
              ],
            ),
          ],
        ));
  }
}
