import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/utils/app_bar_text.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_fonts.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/app_search_bar.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/app_text.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/home_widgets/first_home_screen/history_containers.dart';
import 'package:vehicanich_shop/widgets/home_widgets/first_home_screen/list_view.dart';

class FirstHomeScreen extends StatelessWidget {
  const FirstHomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleText: 'VEHICANICH',
      ),
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSizedBoxHeight(0.03),
            CustomSearchFieldForHome(),
            CustomSizedBoxHeight(0.03),
            const Current_status_containers(),
            CustomSizedBoxHeight(0.04),
            Container(
              color: Appallcolor().listcontainer,
              width: double.infinity,
              height: Mymediaquery().mediaqueryheight(0.04, context),
              child: Center(
                  child: AppText(
                fontFamily: AppFonts.headText,
                text: 'Completed Works',
                size: 0.04,
              )),
            ),
            StreamBuilder(
              stream: BookingReference()
                  .allBookingDetails()
                  .where(Referencekeys.isCompleted, isEqualTo: true)
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
                      CustomSizedBoxHeight(0.13),
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
