import 'package:flutter/material.dart';

import '../../styles/styles.dart';

//Custom InputDecoration for TextFormFields
class StyledInputDecoration extends InputDecoration {
  StyledInputDecoration({
    String? hintText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool? isDense,
  }) : super(
          isDense: isDense,
          contentPadding: EdgeInsets.all($styles.insets.xs),
          hintText: hintText,
          hintStyle:
              $styles.text.bodySmall.copyWith(color: $styles.colors.grey02),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: $styles.colors.grey02)),
          counterStyle: $styles.text.caption.copyWith(
            color: $styles.colors.grey02,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(
            minHeight: 38.0,
            minWidth: 38.0,
          ),
          suffixIconColor: Colors.white,
          fillColor: $styles.colors.grey01,
          filled: true,
        );
}
