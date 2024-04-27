import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class TimeContainer extends StatelessWidget {
  final String text;
  const TimeContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    showtimePicker() {
      showTimePicker(context: context, initialTime: TimeOfDay.now());
    }

    return Container(
      width: Mymediaquery().mediaquerywidth(0.41, context),
      height: Mymediaquery().mediaqueryheight(0.07, context),
      decoration: BoxDecoration(
        color: Appallcolor().textcolor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          SizedBox(
            width: Mymediaquery().mediaquerywidth(0.02, context),
          ),
          Text(
            text,
            style: TextStyle(
              color: Appallcolor().colorblack,
              fontSize: Mymediaquery().mediaquerywidth(0.02, context),
            ),
          ),
          SizedBox(
            width: Mymediaquery().mediaquerywidth(0.24, context),
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
