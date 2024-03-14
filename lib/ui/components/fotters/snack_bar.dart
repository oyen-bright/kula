import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kula/themes/app_colors.dart';

class Constants {
  const Constants._();

  static Duration successSnackBarDuration = 3.seconds;
  static Duration loadingSnackBarDuration = 10.seconds;
  static Duration actionSnackBarDuration = 10.seconds;
}

SnackBar errorSnackBar(String data) {
  return SnackBar(
    content: Text(
      data,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
  );
}

SnackBar successSnackBar(String data) {
  return SnackBar(
    duration: Constants.successSnackBarDuration,
    content: Text(
      data,
      textAlign: TextAlign.center,
    ),
    backgroundColor: AppColors.primaryColor,
  );
}

SnackBar actionSnackBar(String data, SnackBarAction? action) {
  return SnackBar(
    action: action,
    duration: Constants.actionSnackBarDuration,
    content: Text(
      data,
      textAlign: TextAlign.left,
    ),
    backgroundColor: AppColors.primaryColor,
  );
}

Widget activityIndicator = Platform.isAndroid
    ? const SizedBox(height: 10, width: 10, child: CircularProgressIndicator())
    : const CupertinoActivityIndicator();

SnackBar loadingSnackBar(String data, Function()? onDismissed) {
  return SnackBar(
    showCloseIcon: true,
    duration: Constants.loadingSnackBarDuration,
    content: Row(
      children: [
        activityIndicator,
        Expanded(
          child: Text(
            data,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    backgroundColor: AppColors.primaryColor,
  );
}
