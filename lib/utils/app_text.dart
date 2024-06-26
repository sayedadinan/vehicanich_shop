import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final String fontFamily; // New parameter for font family
  const AppText({
    Key? key,
    required this.text,
    required this.size,
    required this.fontFamily, // Required font family parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont(fontFamily).copyWith(
        // Using GoogleFonts.getFont to dynamically get the font
        fontSize: Mymediaquery().mediaquerywidth(size, context),
        color: Appallcolor().primeryWhite,
      ),
    );
  }
}
