import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class AppbarText extends StatelessWidget {
  final String text;
  const AppbarText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Appallcolor().colorwhite,
          fontSize: Mymediaquery().mediaquerywidth(0.06, context)),
    );
  }
}
