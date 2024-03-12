import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';

class LoadingOverlay extends StatelessWidget {
  final String? message;

  final (String, void Function(), int?)? action1;
  final (String, void Function(), int?)? action2;
  final ({
    double sigmaX,
    double sigmaY,
  })? blur;

  const LoadingOverlay(
      {Key? key, this.message, this.blur, this.action1, this.action2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius.normal),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blur?.sigmaX ?? 2.0,
            sigmaY: blur?.sigmaY ?? 2.0,
          ),
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildContent(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContent(BuildContext context) {
    List<Widget> content = [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius.normal),
        ),
        child: const CircularProgressIndicator(),
      ).animate().fadeIn(),
    ];

    if (message != null) {
      content.addAll([
        const SizedBox(
          height: 6,
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
          margin:
              EdgeInsets.symmetric(horizontal: AppConstants.padding.horizontal),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius:
                BorderRadius.circular(AppConstants.borderRadius.normal),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message!,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,

                  // foreground: Paint()
                  //   ..style = PaintingStyle.stroke
                  //   ..strokeWidth = 2.0
                  //   ..color = Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (action1 != null)
                    TextButton(
                        onPressed: action1!.$2,
                        child: Text(
                          action1!.$1,
                          style: TextStyle(
                              color: action1!.$3 != null
                                  ? Color(action1!.$3!)
                                  : null),
                        )),
                  if (action2 != null)
                    TextButton(
                        onPressed: action2!.$2,
                        child: Text(
                          action2!.$1,
                          style: TextStyle(
                              color: action2!.$3 != null
                                  ? Color(action2!.$3!)
                                  : null),
                        )),
                ],
              )
            ],
          ),
        ),
      ]);
    }

    return content;
  }
}
