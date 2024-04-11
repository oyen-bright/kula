// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';

class StarFilterDropdown extends StatefulWidget {
  final void Function(int?) onChanged;

  final int? selectedStars;

  const StarFilterDropdown({
    Key? key,
    required this.onChanged,
    this.selectedStars,
  }) : super(key: key);

  @override
  StarFilterDropdownState createState() => StarFilterDropdownState();
}

class StarFilterDropdownState extends State<StarFilterDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        border: Border.all(color: AppColors.cardStrokeColor),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius.small),
      ),
      child: DropdownButton<int>(
        enableFeedback: true,
        padding: const EdgeInsets.only(right: 10),
        elevation: 3,
        itemHeight: null,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius.large),
        value: widget.selectedStars,
        onChanged: widget.onChanged,
        // onChanged: (int? newValue) {
        //   widget.onChanged(newValue);
        //   setState(() {
        //     _selectedStars = newValue;
        //   });
        // },
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
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
          ),
          child: Text(
            'Filter stars',
            style: context.textTheme.bodyMedium?.copyWith(fontSize: 14),
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
