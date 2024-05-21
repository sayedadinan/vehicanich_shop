import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/app_text.dart';
import 'package:vehicanich_shop/widgets/ratings_and_review/review_showing_card.dart';

class RatingsAndReviews extends StatelessWidget {
  const RatingsAndReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appallcolor().appbackgroundcolor,
        appBar: AppBar(
          centerTitle: true,
          title: const AppText(
              text: 'Ratings and Reviews',
              size: 0.06,
              fontFamily: 'Noto Serif'),
          backgroundColor: Appallcolor().appbarbackgroundcolor,
        ),
        body: StreamBuilder(
            stream: ShopreferenceId()
                .shopCollectionReference()
                .doc(FirebaseDatastoring.shopid)
                .collection(Referencekeys.rateAndReview)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: loader,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Column(
                  children: [
                    CustomSizedBoxHeight(0.13),
                    Center(
                      child: Image.asset('assets/images/urban-842.png'),
                    ),
                    Text(
                      'There are no ratings',
                      style: GoogleFonts.aclonica().copyWith(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                );
              } else {
                final bookingDetails = snapshot.data!.docs;
                return ReviewShowingCard(bookingDetails: bookingDetails);
              }
            }));
  }
}
