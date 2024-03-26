import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/address_cubit/address_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

import 'components/specials_card.dart';
import 'components/vendors_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    shouldAddAddress();
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
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                  const Text(
                    "Justin Travis",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  InkWell(
                    onTap: () =>
                        AppRouter.router.push(AppRoutes.changeLocation),
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
                        const Text("Downtown Menlo park....",
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  AppTextField(
                      readOnly: true,
                      keyboardType: TextInputType.none,
                      onTap: () => AppRouter.router.push(AppRoutes.search),
                      hintColor: const Color.fromARGB(255, 170, 174, 184),
                      hintText: "Search for a restaurant or meal",
                      suffixIcon: Image.asset(
                        AppImages.searchIcon,
                        scale: 2,
                      )).withHorViewPadding,
                  SizedBox(
                    height: 24.h,
                  ),
                  AutoSizeText(
                    "Today’s Special",
                    style: context.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                  ).withHorViewPadding,
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 187.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 8.w,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.padding.horizontal),
                      shrinkWrap: true,
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return const SpecialMealCard();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  AutoSizeText(
                    "Vendors",
                    style: context.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                  ).withHorViewPadding,
                  SizedBox(
                    height: 8.h,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.padding.horizontal),
                    separatorBuilder: (_, __) => SizedBox(
                      height: 8.h,
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return const VendorsCard();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
