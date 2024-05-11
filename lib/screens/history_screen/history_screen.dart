import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/app_text.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/home_widgets/first_home_screen/list_view.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        title: const AppText(
            text: 'History', size: 0.06, fontFamily: 'Noto Serif'),
        backgroundColor: Appallcolor().appbarbackgroundcolor,
      ),
      body: StreamBuilder(
          stream: BookingReference().allBookingDetails().snapshots(),
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
                    'There are no pending bookings',
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
