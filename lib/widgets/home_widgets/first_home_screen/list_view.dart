import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/home_widgets/custom_texts_for_bookings.dart';

class ListViewForCompletedList extends StatelessWidget {
  final List<QueryDocumentSnapshot<Object?>> bookingDetails;
  const ListViewForCompletedList({super.key, required this.bookingDetails});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: bookingDetails.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final bookingdetail = bookingDetails[index];
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                color: Appallcolor().listcontainer,
                borderRadius: BorderRadius.circular(12),
              ),
              height: Mymediaquery().mediaqueryheight(0.12, context),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: Mymediaquery().mediaquerywidth(0.05, context),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.03, context),
                        ),
                        Rowforcontainer(
                            valuetext:
                                bookingdetail[Referencekeys.vahicleNumber],
                            keytext: 'Vehicle Number'),
                        SizedBox(
                          height:
                              Mymediaquery().mediaqueryheight(0.01, context),
                        ),
                        Rowforcontainer(
                            valuetext: bookingdetail[Referencekeys.userPhone],
                            keytext: 'Owner Number'),
                      ],
                    ),
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
