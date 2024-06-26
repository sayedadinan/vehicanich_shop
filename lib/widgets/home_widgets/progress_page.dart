import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/constant_variables/enums.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/home_widgets/list_view.dart';

class ProgresScreen extends StatelessWidget {
  const ProgresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: StreamBuilder(
        stream: BookingReference()
            .allBookingDetails()
            .where(Referencekeys.isStarted, isEqualTo: true)
            .where(Referencekeys.isPending, isEqualTo: false)
            .where(Referencekeys.ordered, isEqualTo: true)
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
              return Center(
                child: Text(
                  'There is no working vehicles',
                  style: GoogleFonts.aclonica().copyWith(
                    fontSize: Mymediaquery()
                        .mediaquerywidth(0.05, context), // Set font size to 20
                    color: Colors.white, // Set font color to blue
                  ),
                ),
              );
            } else {
              final bookingdetails = snapshot.data!.docs;
              return ListViewForBookings(
                type: CurrentStatus.started,
                bookingdetails: bookingdetails,
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}
