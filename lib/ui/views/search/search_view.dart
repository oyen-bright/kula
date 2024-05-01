import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/config/app_routes.dart';
import 'package:kula/cubits/restaurant_cubit/meal_model.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_cubit.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/router/app_router.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/inputs/text_field_input.dart';

import 'component/search_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final List<Restaurant> restaurants;
  late final TextEditingController textEditingController;
  String searchQuery = "";
  List<Meal>? searchResult;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    restaurants = context.read<RestaurantCubit>().state.restaurants;
  }

  void onSearchChange() {
    searchQuery = textEditingController.text;

    if (searchQuery.isEmpty) {
      setState(() {
        searchResult = null;
      });
      return;
    }
    searchResult = restaurants
        .where((restaurant) =>
            restaurant.storeName
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            (restaurant.meals != null &&
                restaurant.meals!.any((meal) => meal.name
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))))
        .expand((restaurant) => restaurant.meals ?? [])
        .map((meal) => meal as Meal)
        .toList();
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
          toolbarHeight: 100,
          title: "",
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: AppTextField(
                      controller: textEditingController,
                      onChanged: (_) {
                        onSearchChange();
                      },
                      keyboardType: TextInputType.none,
                      hintColor: const Color.fromARGB(255, 170, 174, 184),
                      hintText: "Search for a restaurant or meal",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              textEditingController.clear();
                              searchResult = null;
                            });
                          },
                          icon: const Icon(Icons.close)))
                  .withHorViewPadding)),
      body: searchResult == null
          ? _buildSearchImage(context)
          : searchResult!.isEmpty
              ? _buildNoSearchImage(context)
              : ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 10,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.padding.horizontal,
                      vertical: 20),
                  itemCount: searchResult!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SearchItem(
                      onTap: () {
                        final resturant = context
                            .read<RestaurantCubit>()
                            .getResturantByMealId(searchResult![index].id);
                        if (resturant == null) {
                          return;
                        }

                        print(resturant.openingHours);
                        if (!resturant.isOpen) {
                          context.showSnackBar("Restaurant is current closed");
                          return;
                        }
                        AppRouter.router.push(AppRoutes.restaurantMeal, extra: (
                          restaurant: resturant.id,
                          meal: searchResult![index]
                        ));
                      },
                      meal: searchResult![index],
                    );
                  },
                ),
    );
  }
}

_buildSearchImage(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    padding: EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
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
    padding: EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
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
