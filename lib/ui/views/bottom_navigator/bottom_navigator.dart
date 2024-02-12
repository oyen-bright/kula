library app_bottom_navigator;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    setPortraitOrientation();
  }

  @override
  void dispose() {
    resetPreferredOrientations();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget.child.currentIndex,
          onTap: (index) {
            widget.child.goBranch(
              index,
              initialLocation: index == widget.child.currentIndex,
            );
          },
          items: const [
            BottomNavigationBarItem(
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
              icon: BottomNavigationIcon(
                color: AppColors.inActiveBottomNavigationColor,
                name: AppImages.cartIcon,
              ),
              activeIcon: BottomNavigationIcon(
                color: AppColors.activeBottomNavigationColor,
                name: AppImages.cartIcon,
              ),
              label: Strings.cartMenu,
            ),
            BottomNavigationBarItem(
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
            BottomNavigationBarItem(
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
        ));
  }
}
