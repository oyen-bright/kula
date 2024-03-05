import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/extensions/widget.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/drop_down/star_filter_drop_down.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/ui/components/widgets/star_rating.dart';

class RestaurantReview extends StatelessWidget {
  const RestaurantReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewAppBar(
        title: "",
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AutoSizeText(
                      "Chukas buka",
                      maxLines: 1,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            AppImages.starIcon,
                            scale: 1.4,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text.rich(
                            const TextSpan(
                              children: [
                                TextSpan(
                                  text: '4.8 ',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: '(74)',
                                ),
                              ],
                            ),
                            style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ).withHorViewPadding,
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      AppImages.locationIcon,
                      scale: 2,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        child: Text(
                      "Location",
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ))
                  ],
                ).withHorViewPadding,
                const SizedBox(
                  height: 10,
                ),
                AutoSizeText(
                        "No2 Adebowale street, off UBA rd Downtown Menlo park, kubwa, Abuja",
                        style: context.textTheme.bodyMedium
                            ?.copyWith(decoration: TextDecoration.underline))
                    .withHorViewPadding,
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 1.5,
                  color: AppColors.babyBlue,
                ),
                const Align(
                    alignment: Alignment.centerRight,
                    child: StarFilterDropdown()),
                const StarRating(
                  rating: 2.5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
