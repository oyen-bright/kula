import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kula/themes/app_images.dart';
import 'package:kula/ui/components/headers/app_bar.dart';
import 'package:kula/utils/enums.dart';

class AuthenticationWrapper extends StatelessWidget {
  final Widget body;
  final String? viewTitle;
  final WrapperBackgroundImage wrapperBackgroundImage;
  final WrapperBackgroundImageSize wrapperBackgroundImageSize;
  const AuthenticationWrapper(
      {super.key,
      required this.body,
      this.viewTitle,
      this.wrapperBackgroundImageSize = WrapperBackgroundImageSize.small,
      this.wrapperBackgroundImage = WrapperBackgroundImage.two});

  @override
  Widget build(BuildContext context) {
    //TODO: alignment on differnct devices
    return Scaffold(
      appBar: viewTitle != null
          ? ViewAppBar(
              title: viewTitle,
            )
          : null,
      body: Stack(
        children: [
          if (viewTitle == null) ...{
            if (wrapperBackgroundImage == WrapperBackgroundImage.two) ...{
              Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    wrapperBackgroundImageSize ==
                            WrapperBackgroundImageSize.large
                        ? AppImages.backgroundLoginImageTopLeft
                        : AppImages.backgroundImageTopLeft,
                    scale: 2,
                  )).animate().fadeIn(duration: 500.milliseconds),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    wrapperBackgroundImageSize ==
                            WrapperBackgroundImageSize.large
                        ? AppImages.backgroundLoginImageBottomRight
                        : AppImages.backgroundImageBottomRight,
                    scale: 2,
                  )).animate().fadeIn(duration: 500.milliseconds),
            } else
              Positioned(
                  top: 12,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    AppImages.backgroundImageTop,
                    scale: 1.5,
                  )).animate().fadeIn(duration: 500.milliseconds)
          },
          Positioned.fill(
              child: SafeArea(
            bottom: true,
            child: body,
          ))
        ],
      ),
    );
  }
}
