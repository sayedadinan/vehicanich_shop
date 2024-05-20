// class AppTheme {
//   static TextStyle get displaySmall {
//     return TextStyle(
//       color: Appallcolor().textcolor,
//       fontWeight: FontWeight.w600,
//       fontSize: 23,
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyAppTheme {
  static const double borderRadiusValue = 12.0;

  static BorderRadius get borderRadius =>
      BorderRadius.circular(borderRadiusValue);
}
