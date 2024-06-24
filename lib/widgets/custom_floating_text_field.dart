import 'package:google_fonts/google_fonts.dart';
import 'package:iot_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomFloatingTextField extends StatelessWidget {
  CustomFloatingTextField({
    Key? key,
    required this.context,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
    this.suffixWidget,
    this.textAlignVert
  }) : super(
          key: key,
        );

  final BuildContext context;
  final Alignment? alignment;

  final double? width;

  final EdgeInsets? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final String? labelText;

  final TextStyle? labelStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final void Function(String)? onChanged;

  final Widget? suffixWidget;

  final TextAlignVertical? textAlignVert;

  final constColor = PrimaryColors();

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: floatingTextFieldWidget,
          )
        : floatingTextFieldWidget;
  }

  Widget get floatingTextFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        //height: screenHeight * 10,
        child: TextFormField(
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
          controller: controller,
          //focusNode: focusNode ?? FocusNode(),
          //autofocus: autofocus!,
          style: textStyle ?? CustomTextStyles.labelLargeDMSansGray800,
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
          onChanged: onChanged,
          textAlignVertical: textAlignVert,
          cursorColor: PrimaryColors().orangeNormal,
        ),
      );
  InputDecoration get decoration => InputDecoration(

        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.labelLargeDMSansWhiteA700,
        labelText: labelText ?? "",
        labelStyle: labelStyle,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        suffix: suffixWidget,
        isDense: true,
        errorStyle:GoogleFonts.plusJakartaSans(color: constColor.orangeNormal),
        contentPadding:
            contentPadding ?? EdgeInsets.fromLTRB(14.h, 14.v, 14.h, 14.v),
        fillColor:
            fillColor ?? Theme.of(context).colorScheme.surface,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide.none,
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide.none,
            ),
      floatingLabelBehavior: FloatingLabelBehavior.never
      );
}

/// Extension on [CustomFloatingTextField] to facilitate inclusion of all types of border style etc
extension FloatingTextFormFieldStyleHelper on CustomFloatingTextField {
  static OutlineInputBorder get fillWhiteA => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide.none,
      );
}
