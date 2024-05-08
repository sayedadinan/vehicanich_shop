import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_texts.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class ServiceContainers extends StatelessWidget {
  final String text;
  const ServiceContainers({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Mymediaquery().mediaquerywidth(0.06, context),
          right: Mymediaquery().mediaquerywidth(0.06, context)),
      child: Container(
        width: double.infinity,
        height: Mymediaquery().mediaqueryheight(0.07, context),
        decoration: BoxDecoration(
          color: Appallcolor().textcolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.04, context),
            ),
            CustomText(
                text: text,
                fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                color: Appallcolor().colorblack,
                width: FontWeight.w500),
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.11, context),
            ),
            Icon(
              Icons.arrow_right,
              size: Mymediaquery().mediaquerywidth(0.07, context),
            )
          ],
        ),
      ),
    );
  }
}
