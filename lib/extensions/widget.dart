import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/ui/components/bottom_sheet/app_bottom_sheet.dart';
import 'package:kula/utils/enums.dart';
import 'package:kula/utils/haptic_utils.dart';

extension Show on Widget {
  Future<T?> asBottomSheet<T>(BuildContext context,
      {Color? backgroundColor,
      bool? enableDrag,
      bool? isDismissible,
      bool? topSafeArea,
      bool? expand,
      bool invert = false,
      double? elevation,
      Color? barrierColor,
      bool isScrollControlled = false,
      HapticFeedbackType? hapticType = HapticFeedbackType.selection,
      bool? bottomSafeArea}) {
    if (hapticType != null) {
      haptic(hapticType);
    }

    return appBottomSheet<T>(
        invert: invert,
        enableDrag: enableDrag,
        expand: expand,
        isScrollControlled: isScrollControlled,
        context: context,
        elevation: elevation,
        topSafeArea: topSafeArea,
        barrierColor: barrierColor,
        bottomSafeArea: bottomSafeArea ?? true,
        isDismissible: isDismissible,
        backgroundColor: backgroundColor,
        builder: (
          BuildContext context,
        ) =>
            this);
  }

  Future<T?> asDialog<T>(BuildContext context,
      {String? title, void Function()? onClose, bool isDismissible = true}) {
    return showDialog<T>(
        context: context, builder: (BuildContext context) => this);
  }

  Widget get withHorViewPadding {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
      child: this,
    );
  }
}
