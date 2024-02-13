import 'package:flutter/material.dart';

@immutable
class AppTextStyles {
  const AppTextStyles._();

  static const String receiptFontFamily = 'Recepts';
  static const String poppingFontFamily = 'Poppins';

  static const TextStyle unselectedLabelStyle = TextStyle(fontSize: 11);
  static const TextStyle selectedLabelStyle =
      TextStyle(fontSize: 11, fontWeight: FontWeight.bold);

  static const TextStyle inputTextStyle = TextStyle(fontSize: 15);
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle authSectionHeaderTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle authSectionHeader2TextStyle = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle listingFormHeaderTextStyle = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle emptyStateTextStyle = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle nameAvatarTextStyle =
      TextStyle(fontWeight: FontWeight.w300, fontSize: 14);

  static const TextStyle tabBarLabelTextStyle =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 17);
}
