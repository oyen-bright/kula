import 'package:flutter/material.dart';
import 'package:kula/ui/components/fotters/snack_bar.dart';
import 'package:kula/utils/enums.dart';

extension BuildContextExtention on BuildContext {
  void showSnackBar(message,
      [BarType snackBarType = BarType.success, SnackBarAction? action]) {
    if (mounted) {
      ScaffoldMessenger.of(this).removeCurrentSnackBar();
      switch (snackBarType) {
        case BarType.error:
          ScaffoldMessenger.of(this).showSnackBar(errorSnackBar(message));
        case BarType.success:
          ScaffoldMessenger.of(this).showSnackBar(successSnackBar(message));
        case BarType.loading:
          ScaffoldMessenger.of(this)
              .showSnackBar(loadingSnackBar(message, null));
        case BarType.action:
          ScaffoldMessenger.of(this)
              .showSnackBar(actionSnackBar(message, action));
      }
    }
  }

  // void showBanner(String data, List<Widget> actions) {
  //   var scaffoldMessenger =
  //       ScaffoldMessenger.of(read<AppScaffoldController>().key.currentContext!);
  //   scaffoldMessenger.removeCurrentMaterialBanner();
  //   scaffoldMessenger.showMaterialBanner(informationBanner(data, actions));
  // }

  /// Retrieve the current theme data from the context.
  ///
  /// Usage:
  /// ```dart
  /// ColorScheme colorScheme = context.colorScheme;
  /// ```
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Retrieve the current theme data from the context.˚
  ///
  /// Usage:
  /// ```dart
  /// ThemeData colorScheme = context.colorScheme;
  /// ```
  ThemeData get theme => Theme.of(this);

  /// Retrieve the current text theme from the context.
  ///
  /// Usage:
  /// ```dart
  /// ColorScheme colorScheme = context.theme;
  /// ```
  TextTheme get textTheme => Theme.of(this).textTheme;

  dynamic get focus => FocusScope.of(this).nextFocus();
  dynamic get removeFocus => FocusScope.of(this).unfocus();

  Size get viewSize => MediaQuery.of(this).size;
}
