import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class Customquestion extends StatelessWidget {
  const Customquestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.12, context),
        ),
        Text(
          "Didn't received code? ",
          style: TextStyle(color: Appallcolor().textcolor),
        ),
        Text(
          ' Resend',
          style: TextStyle(color: Appallcolor().buttonforgroundcolor),
        )
      ],
    );
  }
}
