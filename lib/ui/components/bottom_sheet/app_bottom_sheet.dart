import 'package:flutter/material.dart';
import 'package:kula/extensions/context.dart';

Future<T?> appBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  Color? barrierColor,
  bool? expand,
  AnimationController? secondAnimation,
  bool? useRootNavigator,
  bool? bounce,
  bool? isDismissible,
  bool? enableDrag,
  bool bottomSafeArea = true,
  bool invert = false,
  bool isScrollControlled = false,
  bool? topSafeArea,
  Duration? duration,
}) {
  backgroundColor ??= context.theme.scaffoldBackgroundColor;
  barrierColor ??= Colors.black54;
  expand ??= false;
  useRootNavigator ??= true;
  bounce ??= true;
  topSafeArea ??= false;
  isDismissible ??= true;
  enableDrag ??= true;

  Widget safeAreaWidget(BuildContext context) => SafeArea(
        top: false,
        bottom: bottomSafeArea,
        child: builder(context),
      );

  return showModalBottomSheet<T>(
    isScrollControlled: isScrollControlled,
    context: context,
    builder: (context) => Padding(
      padding: EdgeInsets.only(top: (MediaQuery.of(context).padding.top + 55)),
      child: Material(color: backgroundColor, child: safeAreaWidget(context)),
    ),
    barrierColor: barrierColor,
    backgroundColor: Colors.transparent,
    elevation: elevation,
    shape: shape,
    clipBehavior: clipBehavior,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
  );
}
