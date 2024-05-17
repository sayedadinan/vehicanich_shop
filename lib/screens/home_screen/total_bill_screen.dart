import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/utils/app_bar_text.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_fonts.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/app_text.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class TotalBillScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const TotalBillScreen({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      appBar: const CustomAppBar(
        titleText: 'Total BIll',
      ),
      body: Column(
        children: [
          CustomSizedBoxHeight(0.06),
          Padding(
            padding: EdgeInsets.only(
                left: Mymediaquery().mediaquerywidth(0.05, context)),
            child: AppText(
                text: 'services', size: 0.05, fontFamily: AppFonts.headText),
          ),
          AppText(
              text: shop[Referencekeys.serviceName],
              size: 0.05,
              fontFamily: AppFonts.headText),
        ],
      ),
    );
  }
}
