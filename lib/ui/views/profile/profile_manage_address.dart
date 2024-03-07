import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

class ProfileManageAddressView extends StatelessWidget {
  const ProfileManageAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        title: "Manage Addresses",
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          AppTextField(
            hintText: "Add new address",
            suffixIcon: Image.asset(
              AppImages.mapIcon,
              scale: 2,
            ),
          ).withHorViewPadding,
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1.5,
            color: AppColors.babyBlue,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Addresses",
                style: context.textTheme.titleLarge
                    ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
              ).withHorViewPadding,
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset(
                            AppImages.locationIcon,
                            scale: 1.5,
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.close,
                                size: 20,
                                color: Colors.black,
                              )),
                          visualDensity: VisualDensity.compact,
                          contentPadding: EdgeInsets.only(
                              left: AppConstants.padding.horizontal, right: 10),
                          minLeadingWidth: 0,
                          horizontalTitleGap: 10,
                          title:
                              const Text("Downtown Menlo park, kubwa, Abuja"),
                        );
                      },
                      separatorBuilder: (_, __) {
                        return const Divider(
                          thickness: 1.5,
                          color: AppColors.babyBlue,
                        );
                      },
                      itemCount: 4))
            ],
          ))
        ],
      ),
    );
  }
}
