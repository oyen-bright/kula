import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';

class LoadingOverlay extends StatefulWidget {
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
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sigmaXAnimation;
  late Animation<double> _sigmaYAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: 1.seconds,
    );

    // _sigmaXAnimation = Tween<double>(
    //   begin: 0,
    //   end: widget.blur?.sigmaX ?? 10.0,
    // ).animate(_controller);

    // _sigmaYAnimation = Tween<double>(
    //   begin: 0,
    //   end: widget.blur?.sigmaY ?? 10.0,
    // ).animate(_controller);

    _sigmaXAnimation = Tween<double>(
      begin: widget.blur?.sigmaX ?? 10.0,
      end: widget.blur?.sigmaX ?? 10.0,
    ).animate(_controller);

    _sigmaYAnimation = Tween<double>(
      begin: widget.blur?.sigmaY ?? 10.0,
      end: widget.blur?.sigmaY ?? 10.0,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ClipRRect(
              borderRadius:
                  BorderRadius.circular(AppConstants.borderRadius.normal),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: _sigmaXAnimation.value,
                  sigmaY: _sigmaYAnimation.value,
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
            );
          }),
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
      ).animate().fadeIn(duration: 2.seconds),
    ];

    if (widget.message != null) {
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
                widget.message!,
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
                  if (widget.action1 != null)
                    TextButton(
                        onPressed: widget.action1!.$2,
                        child: Text(
                          widget.action1!.$1,
                          style: TextStyle(
                              color: widget.action1!.$3 != null
                                  ? Color(widget.action1!.$3!)
                                  : null),
                        )),
                  if (widget.action2 != null)
                    TextButton(
                        onPressed: widget.action2!.$2,
                        child: Text(
                          widget.action2!.$1,
                          style: TextStyle(
                              color: widget.action2!.$3 != null
                                  ? Color(widget.action2!.$3!)
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
