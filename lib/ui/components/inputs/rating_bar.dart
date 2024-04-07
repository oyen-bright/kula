import 'package:flutter/material.dart';
import 'package:kula/themes/app_colors.dart';

class AppRatingBar extends StatefulWidget {
  final int maxRating;
  final int initialRating;
  final Function(int)? onRatingChanged;
  final double? iconSize;
  final bool readOnly;

  const AppRatingBar({
    Key? key,
    required this.maxRating,
    required this.initialRating,
    this.onRatingChanged,
    this.readOnly = false,
    this.iconSize,
  }) : super(key: key);

  @override
  AppRatingBarState createState() => AppRatingBarState();
}

class AppRatingBarState extends State<AppRatingBar> {
  late int _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxRating, (index) {
        if (index < _currentRating) {
          return _buildStar(Icons.star, index, AppColors.primaryColor);
        } else {
          return _buildStar(Icons.star_border, index, AppColors.secondaryColor);
        }
      }).toList(),
    );
  }

  Widget _buildStar(IconData icon, int index, Color color) {
    return GestureDetector(
      onTap: widget.readOnly
          ? null
          : () {
              setState(() {
                _currentRating = index + 1;
                widget.onRatingChanged?.call(_currentRating);
              });
            },
      child: Icon(
        icon,
        size: widget.iconSize,
        color: color,
      ),
    );
  }
}
