import 'package:flutter/material.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_text_styles.dart';

class OTPInputField extends StatefulWidget {
  final int otpLength;
  final void Function(String otpValue)? onChanged;
  final TextEditingController? otpController;

  const OTPInputField({
    Key? key,
    required this.otpLength,
    this.onChanged,
    this.otpController,
  }) : super(key: key);

  @override
  State<OTPInputField> createState() => OTPInputFieldState();
}

class OTPInputFieldState extends State<OTPInputField> {
  late List<TextEditingController> controllers;
  late FocusNode firstFocusNode;

  bool isFilled = false;

  @override
  void initState() {
    super.initState();
    firstFocusNode = FocusNode();
    controllers = List.generate(
      widget.otpLength,
      (index) => TextEditingController(),
    );

    if (widget.otpController != null) {
      widget.otpController!.addListener(() {
        String otpValue = widget.otpController!.text;
        if (otpValue.length == widget.otpLength) {
          for (int i = 0; i < widget.otpLength; i++) {
            controllers[i].text = otpValue[i];
          }
          widget.onChanged?.call(otpValue);
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    firstFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "OTP code",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            widget.otpLength,
            (index) => buildOtpTextField(index),
          ),
        ),
      ],
    );
  }

  Widget buildOtpTextField(int index) {
    return Container(
      decoration: BoxDecoration(
        color: isFilled
            ? AppColors.inputFieldFillColor
            : AppColors.emptyInputFieldFillColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        border: Border.all(color: AppColors.inputFieldStrokeColor, width: 1),
      ),
      width: 48,
      height: 48,
      child: TextField(
        autofillHints: const [AutofillHints.oneTimeCode],
        controller: controllers[index],
        maxLength: 1,
        style: AppTextStyles.inputTextStyle
            .copyWith(fontWeight: FontWeight.w500, fontSize: 24),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          setState(() {
            isFilled = value.isNotEmpty;
          });
          if (value.isNotEmpty) {
            if (index < widget.otpLength - 1) {
              FocusScope.of(context).nextFocus();
            } else {
              String otp =
                  controllers.map((controller) => controller.text).join();
              widget.onChanged?.call(otp);
            }
          } else {
            if (index > 0) {
              FocusScope.of(context).previousFocus();
            }
          }
        },
        focusNode: index == 0 ? firstFocusNode : null,
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
