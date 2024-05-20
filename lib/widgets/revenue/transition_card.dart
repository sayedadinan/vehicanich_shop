import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_fonts.dart';
import 'package:vehicanich_shop/utils/app_text.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class Revenue_transition_card extends StatelessWidget {
  const Revenue_transition_card({
    super.key,
    required this.bookingDetail,
  });

  final bookingDetail;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Appallcolor().appbackgroundcolor,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
              color: Appallcolor().textcolor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100)),
          width: Mymediaquery().mediaquerywidth(0.13, context),
          height: Mymediaquery().mediaqueryheight(0.12, context),
          child: Icon(
            Icons.person,
            color: Appallcolor().textcolor,
          ),
        ),
        title: AppText(
          text: bookingDetail[Referencekeys.userName],
          fontFamily: AppFonts.normalText,
          size: 0.04,
        ),
        subtitle: AppText(
          text: bookingDetail[Referencekeys.todaysDate],
          fontFamily: AppFonts.normalText,
          size: 0.04,
        ),
        trailing: AppText(
            text: '+ ${bookingDetail[Referencekeys.money]}',
            size: 0.04,
            fontFamily: AppFonts.normalText),
      ),
    );
  }
}
