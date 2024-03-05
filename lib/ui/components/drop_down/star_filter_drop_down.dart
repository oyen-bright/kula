import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';

class StarFilterDropdown extends StatefulWidget {
  const StarFilterDropdown({super.key});

  @override
  StarFilterDropdownState createState() => StarFilterDropdownState();
}

class StarFilterDropdownState extends State<StarFilterDropdown> {
  int? _selectedStars;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        border: Border.all(color: AppColors.cardStrokeColor),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
      ),
      child: DropdownButton<int>(
        enableFeedback: true,
        padding: const EdgeInsets.only(right: 10),
        elevation: 3,
        itemHeight: null,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        value: _selectedStars,
        onChanged: (int? newValue) {
          setState(() {
            _selectedStars = newValue;
          });
        },
        items: List.generate(5, (index) {
          int stars = index + 1;
          return DropdownMenuItem<int>(
            value: stars,
            child: _buildStarRating(stars),
          );
        }),
        underline: const SizedBox.shrink(),
        isDense: true,
        alignment: Alignment.center,
        icon: const Icon(
          Icons.filter_list,
          size: 20,
        ),
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Filter stars',
            style: context.textTheme.bodyMedium?.copyWith(fontSize: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildStarRating(int stars) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(stars, (index) {
        return const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        );
      }),
    );
  }
}
