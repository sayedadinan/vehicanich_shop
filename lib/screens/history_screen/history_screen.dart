import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/utils/app_bar_text.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/home_widgets/first_home_screen/list_view.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      appBar: const CustomAppBar(
        titleText: 'History',
      ),
      body: StreamBuilder(
          stream: BookingReference()
              .allBookingDetails()
              .where(Referencekeys.isCompleted, isEqualTo: false)
              .where(Referencekeys.isPending, isEqualTo: false)
              .where(Referencekeys.isStarted, isEqualTo: false)
              .where(Referencekeys.ordered, isEqualTo: true)
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
                  SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.13, context),
                  ),
                  Center(
                    child: Image.asset('assets/images/urban-842.png'),
                  ),
                  Text(
                    'There is no previous bookings',
                    style: GoogleFonts.aclonica().copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              );
            } else {
              final bookingDetails = snapshot.data!.docs;
              return ListViewForCompletedList(
                bookingDetails: bookingDetails,
              );
            }
          }),
    );
  }
}
