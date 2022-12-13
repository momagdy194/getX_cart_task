import 'package:flutter/material.dart';

import '../color.dart';

class OsTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final VoidCallback? onEditingComplete;
  final double paddingValue;
  final int maxLine;
  final int minLine;
  final bool enabled;
  final VoidCallback? onTap;
  final FocusNode? searchFocusNode;
  final TextAlign textAlign;
  final String? suffixText;

  const OsTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.onEditingComplete,
    this.searchFocusNode,
    this.onTap,
    this.maxLine = 5,
    this.minLine = 1,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSubmit,
    this.paddingValue = 0,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.suffixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      textAlign: textAlign,

      onFieldSubmitted: onSubmit,
      onEditingComplete: onEditingComplete,
      onTap: onTap ?? () {},
      focusNode: searchFocusNode,
      enabled: enabled,
      maxLines: maxLine,
      minLines: minLine,
      showCursor: true,
      controller: controller,
      //cursorColor: _theme.primaryColor,
      obscureText: obscureText,
      keyboardType: keyboardType,

      autocorrect: false,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixText: suffixText,
        suffixStyle: const TextStyle(
          color: Colors.black,
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 30,
          maxWidth: 30,
          minHeight: 30,
          minWidth: 30,
        ),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 50,
          maxWidth: 50,
          minHeight: 50,
          minWidth: 50,
        ),
         hintText: hintText,
        hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 11,
            color: AppColors.fontTitle),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.all(paddingValue),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.lightGrey,
              width: 0.5,
            )),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
