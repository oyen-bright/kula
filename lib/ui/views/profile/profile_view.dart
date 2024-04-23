import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/user_cubit/user_cubit.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/widgets/refresh_indicator.dart';
import 'package:kula/utils/amount_formatter.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            const Align(
              alignment: Alignment.center,
              child: WalletInfo(),
            ),
            Expanded(
                child: AppRefreshIndicator(
              onRefresh: () async {
                return context.read<UserCubit>().getWalletInfo().then((value) {
                  if (value != null && context.mounted) {
                    context.showSnackBar(value ?? "");
                  }
                });
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.padding.horizontal),
                      child: Text(
                        "Account",
                        style: context.textTheme.titleLarge?.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    ..._buildAccountOptions(),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.padding.horizontal),
                      child: Text(
                        "Company",
                        style: context.textTheme.titleLarge?.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    ..._buildCompanyOptions()
                  ],
                ),
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => AppRouter.router.go(AppRoutes.login),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      textStyle: const TextStyle(color: Colors.red)),
                  child: const Text("Sign out"),
                )),
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
          contentPadding:
              EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
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
      .animate()
      .slide(duration: 400.ms);
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
          contentPadding:
              EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
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
      .animate()
      .slide(duration: 400.ms);
}

class WalletInfo extends StatefulWidget {
  const WalletInfo({
    super.key,
  });

  @override
  State<WalletInfo> createState() => _WalletInfoState();
}

class _WalletInfoState extends State<WalletInfo> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final amount = amountFormatter(
        context.watch<UserCubit>().state.wallet?.balance ?? "0");

    String maskedAmount = isVisible ? amount : '*' * amount.length;

    return SizedBox(
      height: 135.h,
      width: 361.w,
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadius.large)),
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
                    maskedAmount,
                    style: context.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
                  // Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //   decoration: BoxDecoration(
                  //       color: AppColors.limeGreen,
                  //       borderRadius: BorderRadius.circular(48),
                  //       border: Border.all(color: AppColors.goldenrodColor)),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text("Add funds: Wema 7992929140",
                  //           style: context.textTheme.titleLarge?.copyWith(
                  //               color: Colors.white,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w500)),
                  //       const SizedBox(
                  //         width: 4,
                  //       ),
                  //       Image.asset(
                  //         AppImages.copyIcon,
                  //         scale: 2,
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          Positioned(
              top: 15,
              right: 15,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Image.asset(
                  AppImages.visibilityIcon,
                  scale: 2,
                ),
              ))
        ],
      ),
    );
  }
}
