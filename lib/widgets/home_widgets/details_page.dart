import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/home_widgets/buttons_.dart';

class DetailsScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> bookingDetails;
  const DetailsScreen({super.key, required this.bookingDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appallcolor().appbarbackgroundcolor,
      ),
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Mymediaquery().mediaqueryheight(0.12, context),
                right: Mymediaquery().mediaquerywidth(0.12, context),
                left: Mymediaquery().mediaquerywidth(0.10, context)),
            child: Container(
              color: Appallcolor().appbarbackgroundcolor,
              height: Mymediaquery().mediaqueryheight(0.34, context),
              width: Mymediaquery().mediaquerywidth(0.83, context),
            ),
          ),
          SizedBox(
            height: Mymediaquery().mediaqueryheight(0.20, context),
          ),
          StartedBUtton(
            shop: bookingDetails,
          )
        ],
      ),
    );
  }
}
