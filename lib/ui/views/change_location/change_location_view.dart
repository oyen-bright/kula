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

class ChangeLocationView extends StatefulWidget {
  const ChangeLocationView({super.key});

  @override
  State<ChangeLocationView> createState() => _ChangeLocationViewState();
}

class _ChangeLocationViewState extends State<ChangeLocationView> {
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

  void onChangeLocation(String id) {
    context.read<AddressCubit>().setDefaultAddress(id);
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
          title: "Change location",
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
            onTap: () => onChangeLocation(addresses[index].id),
            trailing: addresses[index].isDefault
                ? Image.asset(
                    AppImages.locationIcon,
                    scale: 1.5,
                  )
                : const SizedBox.shrink(),
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppConstants.padding.horizontal,
            ),
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
              trailing: Image.asset(
                AppImages.locationIcon,
                scale: 1.5,
              ),
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppConstants.padding.horizontal,
              ),
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
