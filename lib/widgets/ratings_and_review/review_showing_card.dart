import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_fonts.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/app_text.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class ReviewShowingCard extends StatelessWidget {
  const ReviewShowingCard({
    super.key,
    required this.bookingDetails,
  });

  final List<QueryDocumentSnapshot<Object?>> bookingDetails;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookingDetails.length,
      itemBuilder: (context, index) {
        final bookingDetail = bookingDetails[index];
        final starCount =
            double.parse(bookingDetail[Referencekeys.ratingCount]);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Appallcolor().appbarbackgroundcolor,
            child: SizedBox(
              width: Mymediaquery().mediaquerywidth(0.20, context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBoxHeight(0.01),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Mymediaquery().mediaquerywidth(0.05, context)),
                    child: AppText(
                        text: bookingDetail[Referencekeys.userName],
                        size: 0.03,
                        fontFamily: AppFonts.headText),
                  ),
                  CustomSizedBoxHeight(0.008),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Mymediaquery().mediaquerywidth(0.04, context)),
                    child: RatingBar.builder(
                      itemSize: Mymediaquery().mediaquerywidth(0.03, context),
                      initialRating: starCount,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      ignoreGestures: true,
                      onRatingUpdate: (rating) {
                        log(rating.toString());
                      },
                    ),
                  ),
                  CustomSizedBoxHeight(0.01),
                  const Divider(
                    endIndent: 20,
                    indent: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Mymediaquery().mediaquerywidth(0.05, context)),
                    child: SizedBox(
                      width: Mymediaquery().mediaquerywidth(0.80, context),
                      child: AppText(
                          fontFamily: AppFonts.normalText,
                          size: 0.03,
                          text: bookingDetail[Referencekeys.feedback]),
                    ),
                  ),
                  CustomSizedBoxHeight(0.02),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
