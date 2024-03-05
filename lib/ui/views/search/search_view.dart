import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

import 'component/search_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
          toolbarHeight: 100,
          title: "",
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: AppTextField(
                      keyboardType: TextInputType.none,
                      hintColor: const Color.fromARGB(255, 170, 174, 184),
                      hintText: "Search for a restaurant or meal",
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.close)))
                  .withHorViewPadding)),
      body: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
          height: 10,
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.viewPaddingHorizontal, vertical: 20),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const SearchItem();
        },
      ),
    );
  }
}

_buildSearchImage(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.viewPaddingHorizontal),
    alignment: Alignment.topCenter,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppImages.searchImage,
          scale: 2,
        ),
        const SizedBox(
          height: 2,
        ),
        AutoSizeText("Search for your favorite meal",
            style: context.textTheme.titleSmall
                ?.copyWith(color: AppColors.slateGrey))
      ],
    ),
  );
}

_buildNoSearchImage(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.viewPaddingHorizontal),
    alignment: Alignment.topCenter,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppImages.noSearchResultImage,
          scale: 2,
        ),
        const SizedBox(
          height: 15,
        ),
        AutoSizeText(
            "What you searched for isn’t currently available please provide information on it for us below",
            textAlign: TextAlign.center,
            style: context.textTheme.titleSmall
                ?.copyWith(color: AppColors.slateGrey)),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () => AppRouter.router.push(AppRoutes.searchGiveFeedBack),
          child: const Text(
            "Provide feedback on meal/restaurant",
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.darkGoldenrod),
          ),
        )
      ],
    ),
  );
}
