import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_fonts.dart';
import 'package:vehicanich_shop/utils/app_text.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class SmallText extends StatelessWidget {
  final String smallText;
  const SmallText({super.key, required this.smallText});

  @override
  Widget build(BuildContext context) {
    return AppText(
      text: smallText,
      size: 0.04,
      fontFamily: AppFonts.headText,
    );
  }
}

class HeadTexts extends StatelessWidget {
  final String headText;
  const HeadTexts({super.key, required this.headText});

  @override
  Widget build(BuildContext context) {
    return AppText(text: headText, size: 0.05, fontFamily: AppFonts.headText);
  }
}

class TotalBIllTextField extends StatelessWidget {
  final String hintText;
  final int maxLine;
  final TextEditingController controller;
  const TotalBIllTextField(
      {super.key,
      required this.hintText,
      required this.maxLine,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: Mymediaquery().mediaquerywidth(0.06, context)),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: Appallcolor().primeryWhite,
        ),
        decoration: InputDecoration(
          fillColor: Appallcolor().appbarbackgroundcolor,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Appallcolor().primeryWhite),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        maxLines: maxLine,
      ),
    );
  }
}
