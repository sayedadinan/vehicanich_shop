import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class ForgotPageText extends StatelessWidget {
  final double fontsize;
  final String text;
  final FontWeight? fontweight;
  const ForgotPageText(
      {super.key, required this.fontsize, required this.text, this.fontweight});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.03, context),
        ),
        Text(text,
            style: TextStyle(
                color: Appallcolor().textcolor,
                fontSize: fontsize,
                fontWeight: fontweight))
      ],
    );
  }
}
