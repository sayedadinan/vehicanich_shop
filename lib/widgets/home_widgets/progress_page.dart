import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
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
                child: Text('No working item here'),
              );
            } else {
              final bookingdetails = snapshot.data!.docs;
              return ListViewForBookings(
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
