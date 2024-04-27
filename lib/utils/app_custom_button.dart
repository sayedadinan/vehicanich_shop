import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Function() function;
  final String text;
  final double fontSize;
  final Color buttontextcolor;

  const CustomButton({
    super.key,
    required this.color,
    required this.function,
    required this.text,
    required this.fontSize,
    required this.buttontextcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: function,
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            width: double.infinity,
            height: Mymediaquery().mediaqueryheight(0.07, context),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0),
            ),
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
      ),
    );
  }
}
