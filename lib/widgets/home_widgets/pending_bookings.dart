import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/constant_variables/enums.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/home_widgets/list_view.dart';

class PendingBookingScreen extends StatelessWidget {
  const PendingBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: BookingReference()
            .allBookingDetails()
            .where(Referencekeys.isPending, isEqualTo: true)
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
                child: Column(
                  children: [
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.23, context)),
                    Center(child: Image.asset('assets/images/urban-842.png')),
                    Text(
                      'There is no pendings',
                      style: GoogleFonts.aclonica().copyWith(
                        fontSize: 20, // Set font size to 20
                        color: Colors.white, // Set font color to blue
                      ),
                    )
                  ],
                ),
              );
            } else {
              final bookingDetails = snapshot.data!.docs;
              return ListViewForBookings(
                bookingdetails: bookingDetails,
                type: CurrentStatus.pending,
              );
            }
          }

          return const SizedBox();
        },
      ),
    );
  }
}
