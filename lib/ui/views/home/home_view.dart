import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

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
                  Row(
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
                  const SizedBox(
                    height: 2,
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
                  Container(
                    width: 273.w,
                    height: 187.h,
                    constraints:
                        const BoxConstraints(minHeight: 187, minWidth: 273),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(
                                        AppConstants.borderRadiusMedium)),
                              )),
                              Positioned(
                                top: 15,
                                left: 15,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 4.h),
                                  decoration: ShapeDecoration(
                                      color: Colors.amber,
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(width: 1),
                                          borderRadius: BorderRadius.circular(
                                              AppConstants.borderRadiusSmall))),
                                  child: AutoSizeText(
                                    "Chicken Republic",
                                    style: context.textTheme.titleSmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: AutoSizeText(
                              "Chicken n Chips",
                              maxLines: 1,
                              style: context.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            )),
                            Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                  color: AppColors.tertiaryColor,
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.borderRadiusSmall)),
                              child: AutoSizeText(
                                "₦4,000",
                                maxLines: 1,
                                style: context.textTheme.bodyMedium,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        border: Border.all(
                            color: AppColors.cardStrokeColor, width: 2),
                        borderRadius: BorderRadius.circular(
                            AppConstants.borderRadiusMedium)),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    width: double.infinity,
                    height: 108.h,
                    child: Row(
                      children: [
                        Container(
                          width: 84.w,
                          height: 84.w,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadiusMedium)),
                        ),
                        Expanded(
                            child: Container(
                          height: 84.h,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                "Chukas buka",
                                maxLines: 1,
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              AutoSizeText(
                                "Hot and spicy catfish daily",
                                maxLines: 1,
                                style: context.textTheme.titleMedium
                                    ?.copyWith(color: AppColors.greyTextColor),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AppImages.timeIcon,
                                            scale: 1.3,
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "50-55 minutes",
                                              maxLines: 1,
                                              style: context
                                                  .textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: AppColors
                                                          .greyTextColor),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            AppImages.starIcon,
                                            scale: 1.3,
                                          ),
                                          Text.rich(
                                            const TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '4.8 ',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '(74)',
                                                ),
                                              ],
                                            ),
                                            style: context.textTheme.bodyMedium
                                                ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  )
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
