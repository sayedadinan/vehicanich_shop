import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class CustomTextShowing extends StatelessWidget {
  final String text;
  const CustomTextShowing({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Appallcolor().textcolor,
      ),
      width: Mymediaquery().mediaquerywidth(0.89, context),
      height: Mymediaquery().mediaqueryheight(0.062, context),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.03, context),
            ),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
            )
          ],
        ),
      ),
    );
  }
}
