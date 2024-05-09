import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class profile_list_widget extends StatelessWidget {
  final String text;
  final IconData icon;
  const profile_list_widget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            color: Appallcolor().textcolor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100)),
        width: Mymediaquery().mediaquerywidth(0.13, context),
        height: Mymediaquery().mediaqueryheight(0.12, context),
        child: Icon(
          icon,
          color: Appallcolor().textcolor,
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
            color: Appallcolor().colorwhite,
            fontWeight: FontWeight.w400,
            fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
      ),
      trailing: Container(
        decoration: BoxDecoration(
            color: Appallcolor().textcolor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100)),
        width: Mymediaquery().mediaquerywidth(0.09, context),
        height: Mymediaquery().mediaqueryheight(0.04, context),
        child: Icon(Icons.arrow_forward_ios,
            size: 24, color: Appallcolor().textcolor),
      ),
    );
  }
}
