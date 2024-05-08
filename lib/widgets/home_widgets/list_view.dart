import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/constant_variables/enums.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich_shop/widgets/home_widgets/custom_texts_for_bookings.dart';
import 'package:vehicanich_shop/widgets/home_widgets/details_page.dart';

class ListViewForBookings extends StatelessWidget {
  final List<QueryDocumentSnapshot<Object?>> bookingdetails;
  final CurrentStatus type;
  const ListViewForBookings(
      {super.key, required this.bookingdetails, required this.type});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookingdetails.length,
      itemBuilder: (context, index) {
        final bookingdetail = bookingdetails[index];
        return Padding(
          padding: EdgeInsets.only(
              left: Mymediaquery().mediaquerywidth(0.02, context),
              right: Mymediaquery().mediaquerywidth(0.02, context),
              top: Mymediaquery().mediaqueryheight(0.01, context)),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(FadeTransitionPageRoute(
                  child: DetailsScreen(
                currentStatus: type,
                bookingDetails: bookingdetail,
              )));
            },
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    color: Appallcolor().listcontainer,
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(width: 1, color: Appallcolor().textcolor)),
                height: Mymediaquery().mediaqueryheight(0.12, context),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Mymediaquery().mediaquerywidth(0.05, context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: Mymediaquery()
                                  .mediaqueryheight(0.03, context)),
                          Rowforcontainer(
                              valuetext: bookingdetails[index]
                                  [Referencekeys.serviceName],
                              keytext: 'Service Category'),
                          Rowforcontainer(
                              valuetext: bookingdetails[index]
                                  [Referencekeys.vahicleNumber],
                              keytext: 'Vehicle Number'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
