import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/headers/app_bar.dart';

class ProfileCustomerSupport extends StatelessWidget {
  const ProfileCustomerSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        title: "Customer Support",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
          child: Column(
            children: [
              ...[
                (AppImages.callIcon, "Call", AppRoutes.profileDetails),
                (AppImages.chatIcon, "Chat", AppRoutes.profileManageAddress),
                (
                  AppImages.twitterIcon,
                  "Twitter",
                  AppRoutes.profileCustomerSupport
                ),
                (
                  AppImages.instagramIcon,
                  "Instagram",
                  AppRoutes.profileGiveFeedback
                )
              ].map(
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
                  // onTap: () => AppRouter.router.push(e.$3),
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
            ],
          ),
        ),
      ),
    );
  }
}
