import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.center,
              child: WalletInfo(),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.viewPaddingHorizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Account",
                      style: context.textTheme.titleLarge
                          ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ..._buildAccountOptions(),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Company",
                      style: context.textTheme.titleLarge
                          ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ..._buildCompanyOptions()
                  ],
                ),
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            TextButton(onPressed: () {}, child: const Text("Sign out")),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> _buildAccountOptions() {
  return [
    (AppImages.privacyDetailsIcon, "Profile details", AppRoutes.profileDetails),
    (AppImages.addressIcon, "Manage addresses", AppRoutes.profileManageAddress),
    (
      AppImages.supportIcon,
      "Customer support",
      AppRoutes.profileCustomerSupport
    ),
    (AppImages.feedBackIcon, "Give feedback", AppRoutes.profileGiveFeedback)
  ]
      .map(
        (e) => ListTile(
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            e.$1,
            color: Colors.black,
            scale: 2,
          ),
          trailing: Image.asset(
            AppImages.forwardIcon,
            scale: 1.9,
          ),
          onTap: () => AppRouter.router.push(e.$3),
          minLeadingWidth: 0,
          titleAlignment: ListTileTitleAlignment.center,
          horizontalTitleGap: 10,
          minVerticalPadding: 10,
          title: Text(
            e.$2,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      )
      .toList()
      .animate(interval: 400.ms)
      .fade(duration: 500.ms);
}

List<Widget> _buildCompanyOptions() {
  return [
    (
      AppImages.termsIcon,
      "Terms of use",
      AppRoutes.profileTermsOfUse,
    ),
    (
      AppImages.privacyIcon,
      "Privacy policy",
      AppRoutes.profilePrivacyPolicies,
    ),
  ]
      .map(
        (e) => ListTile(
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            e.$1,
            color: Colors.black,
            scale: 2,
          ),
          trailing: Image.asset(
            AppImages.forwardIcon,
            scale: 1.9,
          ),
          onTap: () => AppRouter.router.push(e.$3),
          minLeadingWidth: 0,
          titleAlignment: ListTileTitleAlignment.center,
          horizontalTitleGap: 10,
          minVerticalPadding: 10,
          title: Text(
            e.$2,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      )
      .toList()
      .animate(interval: 400.ms)
      .fade(duration: 500.ms);
}

class WalletInfo extends StatelessWidget {
  const WalletInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135.h,
      // padding: const EdgeInsets.symmetric(vertical: 10),

      width: 361.w,
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadiusLarge)),
          )),
          Positioned.fill(
              child: Image.asset(
            AppImages.linesBG,
          )),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Wallet Balance",
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    "₦0",
                    style: context.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: AppColors.limeGreen,
                        borderRadius: BorderRadius.circular(48),
                        border: Border.all(color: AppColors.goldenrodColor)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add funds: Wema 7992929140",
                            style: context.textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          AppImages.copyIcon,
                          scale: 2,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 15,
              right: 15,
              child: Image.asset(
                AppImages.visibilityIcon,
                scale: 2,
              ))
        ],
      ),
    );
  }
}
