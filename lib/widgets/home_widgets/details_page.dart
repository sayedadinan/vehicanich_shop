import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';
import 'package:vehicanich_shop/utils/constant_variables/enums.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/home_widgets/buttons_.dart';
import 'package:vehicanich_shop/widgets/home_widgets/custom_texts_for_bookings.dart';

class CompletedDetailsScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> bookingDetails;
  final CurrentStatus currentStatus;
  const CompletedDetailsScreen(
      {super.key, required this.bookingDetails, required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appallcolor().appbarbackgroundcolor,
      ),
      backgroundColor: Appallcolor().colorblack,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: Mymediaquery().mediaqueryheight(0.02, context)),
          Padding(
            padding: EdgeInsets.only(
                left: Mymediaquery().mediaquerywidth(0.05, context),
                right: Mymediaquery().mediaquerywidth(0.05, context)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Appallcolor().textcolor,
              ),
              width: double.infinity,
              height: Mymediaquery().mediaqueryheight(0.05, context),
              child: Row(
                children: [
                  SizedBox(
                    width: Mymediaquery().mediaquerywidth(0.04, context),
                  ),
                  const Text('booked date'),
                  SizedBox(
                    width: Mymediaquery().mediaquerywidth(0.04, context),
                  ),
                  Text(bookingDetails[Referencekeys.date]),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Mymediaquery().mediaqueryheight(0.02, context),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Appallcolor().colorwhite,
            ),
            width: Mymediaquery().mediaquerywidth(0.86, context),
            height: Mymediaquery().mediaqueryheight(0.36, context),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/car for vehicanich.webp',
                  fit: BoxFit.fill,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    color: Appallcolor().textcolor,
                  ),

                  // width: Mymediaquery().mediaquerywidth(0.02, context),
                  height: Mymediaquery().mediaqueryheight(0.14, context),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.02, context),
                      ),
                      CustomisedtextforDetails(
                          keytext: 'Service Category',
                          valuetext: bookingDetails[Referencekeys.serviceName]),
                      SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.01, context),
                      ),
                      CustomisedtextforDetails(
                          valuetext:
                              bookingDetails[Referencekeys.vahicleNumber],
                          keytext: 'Vehicle Number'),
                      SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.01, context),
                      ),
                      CustomisedtextforDetails(
                          valuetext: bookingDetails[Referencekeys.userPhone],
                          keytext: 'Customer phone'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Mymediaquery().mediaqueryheight(0.03, context),
          ),
          Row(
            children: [
              SizedBox(
                width: Mymediaquery().mediaquerywidth(0.01, context),
              ),
              SizedBox(
                width: Mymediaquery().mediaquerywidth(0.80, context),
                child: const Inputfield(hinttext: 'any thing to say .?'),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Appallcolor().appbarbackgroundcolor,
                    borderRadius: BorderRadius.circular(10)),
                height: Mymediaquery().mediaqueryheight(0.06, context),
                width: Mymediaquery().mediaquerywidth(0.12, context),
                child: const Center(
                  child: Text('Send'),
                ),
              )
            ],
          ),
          SizedBox(
            height: Mymediaquery().mediaqueryheight(0.04, context),
          ),
          switch (currentStatus) {
            CurrentStatus.done => DoneBUtton(shop: bookingDetails),
            CurrentStatus.pending => StartedBUtton(shop: bookingDetails),
            CurrentStatus.started => CompletedBUtton(shop: bookingDetails)
          }
        ]),
      ),
    );
  }
}
