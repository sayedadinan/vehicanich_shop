import 'package:flutter/widgets.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class CustomTextforList extends StatelessWidget {
  final String text;
  const CustomTextforList({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Appallcolor().textcolor,
          fontSize: Mymediaquery().mediaquerywidth(0.04, context),
          fontWeight: FontWeight.w500),
    );
  }
}

class Rowforcontainer extends StatelessWidget {
  final String keytext;
  final String valuetext;
  const Rowforcontainer(
      {super.key, required this.valuetext, required this.keytext});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: Mymediaquery().mediaquerywidth(0.08, context)),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.32, context),
          child: CustomTextforList(text: keytext),
        ),
        Text(
          ':',
          style: TextStyle(
            fontSize: 20,
            color: Appallcolor().textcolor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: Mymediaquery().mediaquerywidth(0.04, context)),
          child: Text(
            valuetext,
            style: TextStyle(
                color: Appallcolor().textcolor,
                fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
