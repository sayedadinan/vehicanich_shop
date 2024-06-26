import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class CustomGoogleButton extends StatelessWidget {
  final Color color;
  final Color bordercolor;
  final Function() function;
  final String text;
  final double fontSize;
  final Color buttontextcolor;
  const CustomGoogleButton({
    super.key,
    required this.color,
    required this.function,
    required this.text,
    required this.fontSize,
    required this.buttontextcolor,
    required this.bordercolor,
  });

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
          border: Border.all(color: bordercolor),
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: function,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: buttontextcolor,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
