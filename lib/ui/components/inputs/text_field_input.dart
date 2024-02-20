// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final Object? fieldTitle;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? suffixText;
  final Widget? prefixIcon;
  final String? prefixText;
  final String? hintText;
  final int? maxLines;
  final String? initialValue;
  final bool _showObscureIcon;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final Color? backgroundColor;
  final String? labelText;
  final void Function()? onTap;
  final InputBorder? errorBorder;
  final void Function(String)? onChanged;

  const AppTextField._internal({
    this.controller,
    this.keyboardType,
    this.validator,
    this.prefixText,
    this.prefixIcon,
    this.maxLines,
    this.suffixText,
    this.fieldTitle,
    this.readOnly = false,
    this.hintText,
    this.initialValue,
    this.autofillHints,
    this.backgroundColor,
    this.onFieldSubmitted,
    this.textCapitalization,
    this.labelText,
    this.errorBorder,
    bool showObscureIcon = false,
    this.onChanged,
    this.textInputAction,
    this.inputFormatters,
    this.suffixIcon,
    this.onTap,
  }) : _showObscureIcon = showObscureIcon;

  factory AppTextField(
      {String? Function(String?)? validator,
      TextEditingController? controller,
      TextInputType? keyboardType,
      bool readOnly = false,
      int? maxLines = 1,
      String? prefixText,
      Widget? prefixIcon,
      String? fieldTitle,
      String? initialValue,
      Color? backgroundColor,
      void Function(String)? onChanged,
      String? suffixText,
      Widget? suffixIcon,
      bool showObscureTextIcon = false,
      List<TextInputFormatter>? inputFormatters,
      void Function()? onTap,
      Iterable<String>? autofillHints,
      String? labelText,
      TextInputAction? textInputAction,
      TextCapitalization? textCapitalization,
      void Function(String)? onFieldSubmitted,
      String? hintText,
      InputBorder? errorBorder}) {
    return AppTextField._internal(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      onTap: onTap,
      prefixText: prefixText,
      errorBorder: errorBorder,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      fieldTitle: fieldTitle,
      initialValue: initialValue,
      textCapitalization: textCapitalization,
      backgroundColor: backgroundColor,
      maxLines: maxLines,
      labelText: labelText,
      onChanged: onChanged,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffixText: suffixText,
      hintText: hintText,
      validator: validator,
    );
  }

  factory AppTextField.password({
    TextEditingController? controller,
    String? Function(String?)? validator,
    TextInputAction? textInputAction,
    void Function(String)? onFieldSubmitted,
    TextInputType? keyboardType,
    String? fieldTitle,
    int? maxLines = 1,
    void Function()? onTap,
    Iterable<String>? autofillHints,
    bool readOnly = false,
    bool showObscureTextIcon = true,
    bool showHiddenIcon = true,
    String? hintText,
  }) {
    return AppTextField._internal(
      controller: controller,
      autofillHints: autofillHints,
      readOnly: readOnly,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      hintText: hintText,
      onTap: onTap,
      maxLines: maxLines,
      onFieldSubmitted: onFieldSubmitted,
      fieldTitle: fieldTitle,
      validator: validator,
      showObscureIcon: showHiddenIcon,
    );
  }

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscureText = false;
  bool isFilled = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget._showObscureIcon ? true : false;
    isFilled = widget.controller?.text.isNotEmpty ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.fieldTitle != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: widget.fieldTitle is Widget
                ? widget.fieldTitle as Widget
                : Text(
                    widget.fieldTitle! as String,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
          ),
        TextFormField(
          autofillHints: widget.autofillHints,
          onFieldSubmitted: widget.onFieldSubmitted,
          maxLines: widget._showObscureIcon ? 1 : widget.maxLines,
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }

            setState(() {
              isFilled = value.isNotEmpty;
            });
          },
          textInputAction: widget.textInputAction,
          readOnly: widget.readOnly,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          obscureText: widget._showObscureIcon ? obscureText : false,
          controller: widget.controller,
          onTap: widget.onTap,
          textAlign: TextAlign.left,
          initialValue: widget.initialValue,
          style: AppTextStyles.inputTextStyle,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 18),
            filled: true,
            suffixText: widget.suffixText,
            prefixText: widget.prefixText,
            fillColor: isFilled
                ? AppColors.inputFieldFillColor
                : AppColors.emptyInputFieldFillColor,
            hintText: widget.hintText,
            labelText: widget.labelText,
            hintStyle:
                const TextStyle(color: AppColors.inputFieldHintTextColor),
            errorBorder: widget.errorBorder ??
                OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadiusLarge)),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(AppConstants.borderRadiusLarge),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(AppConstants.borderRadiusLarge),
              borderSide: const BorderSide(
                color: AppColors.inputFieldStrokeColor,
                style: BorderStyle.solid,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadiusLarge),
                borderSide: BorderSide(color: context.colorScheme.primary)),
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
