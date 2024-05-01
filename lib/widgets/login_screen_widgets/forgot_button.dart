import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class Forgetbutton extends StatelessWidget {
  final Function() function;
  const Forgetbutton({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.65, context),
        ),
        GestureDetector(
          onTap: function,
          child: Text(
            'Forgot Password?',
            style: TextStyle(
                color: Appallcolor().textcolor,
                fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
          ),
        ),
      ],
    );
  }
}
