import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: Mymediaquery().mediaquerywidth(0.35, context),
          color: Appallcolor().colorwhite,
        ),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.04, context),
        ),
        Text(
          'Or',
          style: TextStyle(color: Appallcolor().colorwhite),
        ),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.03, context),
        ),
        Container(
          height: 1,
          width: Mymediaquery().mediaquerywidth(0.35, context),
          color: Appallcolor().colorwhite,
        ),
      ],
    );
  }
}
