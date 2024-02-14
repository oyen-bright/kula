// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kula/config/app_constants.dart';
import 'package:kula/extensions/context.dart';
import 'package:kula/themes/app_colors.dart';
import 'package:kula/themes/app_text_styles.dart';

class AppTextField extends StatelessWidget {
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

  factory AppTextField({
    String? Function(String?)? validator,
    TextEditingController? controller,
    TextInputType? keyboardType,
    bool readOnly = false,
    int? maxLines = 1,
    String? fieldTitle,
    bool showObscureTextIcon = false,
    List<TextInputFormatter>? inputFormatters,
    void Function()? onTap,
    Iterable<String>? autofillHints,
    TextInputAction? textInputAction,
    void Function(String)? onFieldSubmitted,
    String? hintText,
  }) {
    return AppTextField._internal(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      onTap: onTap,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      fieldTitle: fieldTitle,
      maxLines: maxLines,
      hintText: hintText,
      validator: validator,
    );
  }

  factory AppTextField.otp({
    String? Function(String?)? validator,
    TextEditingController? controller,
    TextInputType? keyboardType,
    bool readOnly = false,
    String? fieldTitle,
    void Function(String)? onChanged,
    List<TextInputFormatter>? inputFormatters,
    void Function()? onTap,
    Iterable<String>? autofillHints,
    TextInputAction? textInputAction,
    void Function(String)? onFieldSubmitted,
    String? hintText,
  }) {
    return AppTextField._internal(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r' ')),
      ],
      onChanged: onChanged,
      onTap: onTap,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      fieldTitle: fieldTitle,
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

  factory AppTextField.withColor({
    TextEditingController? controller,
    String? Function(String?)? validator,
    TextInputAction? textInputAction,
    void Function(String)? onFieldSubmitted,
    TextInputType? keyboardType,
    String? fieldTitle,
    Widget? suffixIcon,
    void Function()? onTap,
    String? labelText,
    InputBorder? errorBorder,
    final Color? backgroundColor,
    Iterable<String>? autofillHints,
    bool readOnly = false,
    bool showObscureTextIcon = false,
    String? hintText,
  }) {
    return AppTextField._internal(
      controller: controller,
      labelText: labelText,
      autofillHints: autofillHints,
      readOnly: readOnly,
      errorBorder: errorBorder,
      onTap: onTap,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      hintText: hintText,
      suffixIcon: suffixIcon,
      onFieldSubmitted: onFieldSubmitted,
      fieldTitle: fieldTitle,
      validator: validator,
      backgroundColor: backgroundColor,
      showObscureIcon: showObscureTextIcon,
    );
  }

  factory AppTextField.withLabel({
    TextEditingController? controller,
    TextCapitalization? textCapitalization,
    String? Function(String?)? validator,
    TextInputAction? textInputAction,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? initialValue,
    void Function(String)? onFieldSubmitted,
    void Function(String)? onChanged,
    TextInputType? keyboardType,
    String? fieldTitle,
    final Color? backgroundColor,
    Iterable<String>? autofillHints,
    bool readOnly = false,
    void Function()? onTap,
    bool showObscureTextIcon = false,
    String? hintText,
    String? labelText,
    int? maxLines,
    String? suffixText,
    String? prefixText,
  }) {
    return AppTextField._internal(
        controller: controller,
        autofillHints: autofillHints,
        readOnly: readOnly,
        initialValue: initialValue,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        hintText: hintText,
        textCapitalization: textCapitalization,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        maxLines: maxLines,
        onTap: onTap,
        fieldTitle: fieldTitle,
        validator: validator,
        backgroundColor: backgroundColor,
        showObscureIcon: showObscureTextIcon,
        labelText: labelText,
        suffixIcon: suffixIcon,
        suffixText: suffixText,
        prefixIcon: prefixIcon,
        prefixText: prefixText);
  }

  @override
  Widget build(BuildContext context) {
    final obscureText = _showObscureIcon ? true : false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (fieldTitle != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: fieldTitle is Widget
                ? fieldTitle as Widget
                : Text(
                    fieldTitle! as String,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
          ),
        TextFormField(
          autofillHints: autofillHints,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: _showObscureIcon ? 1 : maxLines,
          onChanged: onChanged,
          textInputAction: textInputAction,
          readOnly: readOnly,
          inputFormatters: inputFormatters,
          validator: validator,
          obscureText: _showObscureIcon ? obscureText : false,
          controller: controller,
          onTap: onTap,
          textAlign: TextAlign.left,
          initialValue: initialValue,
          style: AppTextStyles.inputTextStyle,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 18),
            filled: true,
            suffixText: suffixText,
            prefixText: prefixText,
            fillColor: AppColors.inputFieldFillColor,
            hintText: hintText,
            labelText: labelText,
            hintStyle:
                const TextStyle(color: AppColors.inputFieldHintTextColor),
            errorBorder: errorBorder ??
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
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
