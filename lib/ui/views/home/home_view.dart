import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

import 'components/specials_card.dart';
import 'components/vendors_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                  const SizedBox(
                    height: 2,
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
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
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
                  const SizedBox(
                    height: 15,
                  ),
                  AutoSizeText(
                    "Today’s Special",
                    style: context.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ).withHorViewPadding,
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 187,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.viewPaddingHorizontal),
                      shrinkWrap: true,
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return const SpecialMealCard();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AutoSizeText(
                    "Vendors",
                    style: context.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ).withHorViewPadding,
                  const SizedBox(
                    height: 5,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.viewPaddingHorizontal),
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 10,
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
