import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/home_widgets/custom_texts_for_bookings.dart';

class ListViewForBookings extends StatelessWidget {
  final List<QueryDocumentSnapshot<Object?>> bookingdetails;
  const ListViewForBookings({super.key, required this.bookingdetails});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookingdetails.length,
      itemBuilder: (context, index) {
        // Replace the return statement with your desired widget
        return Padding(
          padding: EdgeInsets.only(
              left: Mymediaquery().mediaquerywidth(0.02, context),
              right: Mymediaquery().mediaquerywidth(0.02, context),
              top: Mymediaquery().mediaqueryheight(0.01, context)),
          child: Card(
            color: Appallcolor().listcontainer,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Appallcolor().textcolor)),
              height: Mymediaquery().mediaqueryheight(0.14, context),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.02, context)),
                      Rowforcontainer(
                          valuetext: bookingdetails[index]
                              [Referencekeys.serviceName],
                          keytext: 'service name'),
                      Rowforcontainer(
                        keytext: 'date',
                        valuetext: bookingdetails[index][Referencekeys.date],
                      ),
                      Rowforcontainer(
                        keytext: 'phone',
                        valuetext: bookingdetails[index][Referencekeys.date],
                      ),
                      Rowforcontainer(
                          valuetext: bookingdetails[index]
                              [Referencekeys.vahicleNumber],
                          keytext: 'vehicle number'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
