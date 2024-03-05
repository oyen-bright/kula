import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int totalStars;
  final double starSize;

  const StarRating({
    Key? key,
    required this.rating,
    this.totalStars = 5,
    this.starSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double normalizedRating = rating.clamp(0, totalStars.toDouble());
    int fullStars = normalizedRating.floor();
    int halfStars = (normalizedRating - fullStars).round();
    int emptyStars = totalStars - fullStars - halfStars;

    List<Widget> starWidgets = [];
    for (int i = 0; i < fullStars; i++) {
      starWidgets.add(_buildStar(true));
    }

    if (halfStars == 1) {
      starWidgets.add(_buildStar(false, isHalf: true));
    }

    for (int i = 0; i < emptyStars; i++) {
      starWidgets.add(_buildStar(false));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: starWidgets,
    );
  }

  Widget _buildStar(bool isFull, {bool isHalf = false}) {
    return Image.asset(
      isFull
          ? "assets/icons/Star.png"
          : isHalf
              ? "assets/icons/Half-start.png"
              : "assets/icons/no_Star.png",
      width: starSize,
      height: starSize,
      scale: 1.7,
    );
  }
}
