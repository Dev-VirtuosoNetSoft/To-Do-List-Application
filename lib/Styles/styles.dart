import 'package:flutter/material.dart';

class Styles {
  static const Color backgroundColor = Color(0xFF282828); // Light Gray
  static const Color textColor = Color(0xFFFFFFFF); // Dark Gray

  static TextStyle titleStyling({Color? color}) {
    return TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w800,
      color: color ?? Styles.textColor, // fallback
    );
  }

  static TextStyle subTitleStyling({Color? color}) {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: color ?? Styles.textColor,
    );
  }

  static TextStyle fieldHeadingStyling({Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color ?? Styles.textColor,
    );
  }
}
