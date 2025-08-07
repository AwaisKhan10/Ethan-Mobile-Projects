
import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/core/constants/text_style.dart';

final authFieldDecoration = InputDecoration(
  hintText: "Enter your email",
  hintStyle: style16,
  prefixIconColor: blackColor,
  suffixIconColor: blackColor,
  fillColor: whiteColor,
  filled: true,
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: textfiledBorderColor, width: 1.0),
      borderRadius: BorderRadius.circular(16)),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: textfiledBorderColor, width: 1.0),
      borderRadius: BorderRadius.circular(16)),
  errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: textfiledBorderColor, width: 1.0),
      borderRadius: BorderRadius.circular(16)),
  disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: textfiledBorderColor, width: 1.0),
      borderRadius: BorderRadius.circular(16)),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: textfiledBorderColor, width: 1.0),
      borderRadius: BorderRadius.circular(16)),
);

final authSignUpFieldDecoration = InputDecoration(
  hintText: "Enter your email",
  hintStyle: style16,
  prefixIconColor: blackColor,
  suffixIconColor: blackColor,
  fillColor: whiteColor,
  filled: true,
  border: InputBorder.none,
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: borderColor),
    borderRadius: BorderRadius.circular(15),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: borderColor),
    borderRadius: BorderRadius.circular(15),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: borderColor),
    borderRadius: BorderRadius.circular(15),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: borderColor),
    borderRadius: BorderRadius.circular(15),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: borderColor),
    borderRadius: BorderRadius.circular(15),
  ),
);
