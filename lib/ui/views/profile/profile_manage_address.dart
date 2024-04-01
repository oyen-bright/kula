import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/cubits/address_cubit/address_cubit.dart';
import 'package:kula/cubits/address_cubit/address_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';
import 'package:kula/ui/components/widgets/refresh_indicator.dart';
import 'package:kula/ui/components/widgets/shimmer.dart';
import 'package:kula/ui/views/add_address/add_additional_address.dart';
import 'package:kula/ui/views/authentication/sign_up/models/address_input.dart';

class ProfileManageAddressView extends StatefulWidget {
  const ProfileManageAddressView({super.key});

  @override
  State<ProfileManageAddressView> createState() =>
      _ProfileManageAddressViewState();
}

class _ProfileManageAddressViewState extends State<ProfileManageAddressView> {
  @override
  void initState() {
    super.initState();
    context.read<AddressCubit>().getAddress();
  }

  void onDeleteAddress(String id) {
    context.read<AddressCubit>().deleteAddress(id);
  }

  void onAddAddress() {
    const AddAdditionalAddress(
      address: null,
    )
        .asBottomSheet<InputAddress?>(context,
            isScrollControlled: true, topSafeArea: true)
        .then((value) => {
              if (value != null)
                {context.read<AddressCubit>().addAddress(value)}
            });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () => null,
            error: (error, _) => context.showSnackBar(error));
      },
      child: Scaffold(
        appBar: ViewAppBar(
          title: "Manage Addresses",
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              readOnly: true,
              onTap: onAddAddress,
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
                Expanded(child: BlocBuilder<AddressCubit, AddressState>(
                  builder: (context, state) {
                    return AppRefreshIndicator(
                      onRefresh: () =>
                          context.read<AddressCubit>().getAddress(),
                      child: state.map(
                          initial: (_) => buildShimmerList(),
                          loaded: (state) => buildList(state.addresses),
                          loading: (_) => buildShimmerList(),
                          error: (_) => buildShimmerList()),
                    );
                  },
                ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget buildList(List<Address> addresses) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              AppImages.locationIcon,
              scale: 1.5,
            ),
            trailing: IconButton(
                onPressed: () => onDeleteAddress(addresses[index].id),
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
            title: Text(addresses[index].getFormattedAddress),
          );
        },
        separatorBuilder: (_, __) {
          return const Divider(
            thickness: 1.5,
            color: AppColors.babyBlue,
          );
        },
        itemCount: addresses.length);
  }

  Widget buildShimmerList() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return AppShimmer(
            child: ListTile(
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
              title: const Text("Downtown Menlo park, kubwa, Abuja"),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return const Divider(
            thickness: 1.5,
            color: AppColors.babyBlue,
          );
        },
        itemCount: 4);
  }
}
