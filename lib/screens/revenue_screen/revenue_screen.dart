import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/payment/revenue_bloc/bloc/revenue_bloc.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';
import 'package:vehicanich_shop/utils/app_bar_text.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_fonts.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/app_text.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/revenue/transition_card.dart';

class RevenueShowingScreen extends StatelessWidget {
  const RevenueShowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Revenue'),
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSizedBoxHeight(0.06),
            Card(
              elevation: 4,
              color: Appallcolor().appbarbackgroundcolor,
              child: SizedBox(
                width: Mymediaquery().mediaquerywidth(0.90, context),
                height: Mymediaquery().mediaqueryheight(0.22, context),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Mymediaquery().mediaquerywidth(0.06, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSizedBoxHeight(0.03),
                      AppText(
                          text: 'Your all Income here',
                          size: 0.05,
                          fontFamily: AppFonts.normalText),
                      CustomSizedBoxHeight(0.04),
                      AppText(
                          text: 'Balance',
                          size: 0.05,
                          fontFamily: AppFonts.headText),
                      CustomSizedBoxHeight(0.001),
                      AppText(
                          text: BlocProvider.of<RevenueBloc>(context)
                              .state
                              .balanceAmount
                              .toString(),
                          size: 0.06,
                          fontFamily: AppFonts.normalText),
                    ],
                  ),
                ),
              ),
            ),
            CustomSizedBoxHeight(0.04),
            Container(
              decoration: BoxDecoration(
                color: Appallcolor().appbarbackgroundcolor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              width: double.infinity,
              height: Mymediaquery().mediaqueryheight(0.64, context),
              padding: EdgeInsets.symmetric(
                horizontal: Mymediaquery().mediaquerywidth(0.05, context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBoxHeight(0.04),
                  AppText(
                    text: 'Transactions',
                    size: 0.05,
                    fontFamily: AppFonts.headText,
                  ),
                  CustomSizedBoxHeight(0.02),
                  StreamBuilder(
                    stream: ShopreferenceId()
                        .shopCollectionReference()
                        .doc(FirebaseDatastoring.shopid)
                        .collection(Referencekeys.wallet)
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Return a loader widget here
                        return Center(child: loader);
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData ||
                          snapshot.data!.docs.isEmpty) {
                        log('object ');
                        // Display a message if no data is available
                        return Column(
                          children: [
                            CustomSizedBoxHeight(0.13),
                            Center(
                              child: Image.asset('assets/images/urban-842.png'),
                            ),
                            const Text(
                              'There are no pending bookings',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        );
                      } else {
                        final bookingDetails = snapshot.data!.docs;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final bookingDetail = bookingDetails[index];
                            context.read<RevenueBloc>().add(TotalRevenue(
                                amount: bookingDetail[Referencekeys.money]));
                            // Access your data here using snapshot.data!.docs[index]
                            return Revenue_transition_card(
                                bookingDetail: bookingDetail);
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
