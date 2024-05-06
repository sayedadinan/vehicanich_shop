import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich_shop/widgets/home_widgets/custom_texts_for_bookings.dart';
import 'package:vehicanich_shop/widgets/home_widgets/details_page.dart';

class PendingBookingScreen extends StatelessWidget {
  const PendingBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: BookingReference()
            .allBookingDetails()
            // .where(Referencekeys.isPending, isEqualTo: false)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: loader,
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No Pendings here'),
              );
            } else {
              final bookingDetails = snapshot.data!.docs;
              return ListView.builder(
                itemCount: bookingDetails.length,
                itemBuilder: (context, index) {
                  final bookingSingleDetails = bookingDetails[index];
                  // Replace the return statement with your desired widget
                  return Padding(
                    padding: EdgeInsets.only(
                        left: Mymediaquery().mediaquerywidth(0.02, context),
                        right: Mymediaquery().mediaquerywidth(0.02, context),
                        top: Mymediaquery().mediaqueryheight(0.01, context)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(FadeTransitionPageRoute(
                            child: DetailsScreen(
                          bookingDetails: bookingSingleDetails,
                        )));
                      },
                      child: Card(
                        color: Appallcolor().listcontainer,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  width: 1, color: Appallcolor().textcolor)),
                          height:
                              Mymediaquery().mediaqueryheight(0.14, context),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: Mymediaquery()
                                          .mediaqueryheight(0.02, context)),
                                  Rowforcontainer(
                                      valuetext: bookingDetails[index]
                                          [Referencekeys.serviceName],
                                      keytext: 'service name'),
                                  Rowforcontainer(
                                    keytext: 'date',
                                    valuetext: bookingDetails[index]
                                        [Referencekeys.date],
                                  ),
                                  Rowforcontainer(
                                    keytext: 'phone',
                                    valuetext: bookingDetails[index]
                                        [Referencekeys.date],
                                  ),
                                  Rowforcontainer(
                                      valuetext: bookingDetails[index]
                                          [Referencekeys.vahicleNumber],
                                      keytext: 'vehicle number'),
                                ],
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
          // Add a default return statement if needed
          return const SizedBox();
        },
      ),
    );
  }
}
