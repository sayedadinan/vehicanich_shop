import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/services/connectivity/internet_connection.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/connectivity_widget/connectivity_screen.dart';
import 'package:vehicanich_shop/widgets/home_widgets/progress_page.dart';
import 'package:vehicanich_shop/widgets/home_widgets/pending_bookings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Appallcolor().appbackgroundcolor,
          appBar: AppBar(
            backgroundColor: Appallcolor().appbarbackgroundcolor,
            title: Text(
              'Requests',
              style: TextStyle(color: Appallcolor().colorwhite),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: const [
                Tab(text: 'Pendings'),
                Tab(text: 'in Progress'),
              ],
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: Appallcolor().textcolor,
              ),
              dividerColor: Appallcolor().appbackgroundcolor,
              indicatorPadding: EdgeInsets.only(
                left: Mymediaquery().mediaquerywidth(0.02, context),
                right: Mymediaquery().mediaquerywidth(0.02, context),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Appallcolor().appbarbackgroundcolor,
              indicatorColor: Appallcolor().buttonforgroundcolor,
              unselectedLabelColor: Appallcolor().colorwhite,
            ),
          ),
          body: StreamBuilder(
              stream: checkInternetConnection(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !snapshot.data!) {
                  return const ConnectivityWidget();
                }
                return const TabBarView(children: [
                  PendingBookingScreen(),
                  ProgresScreen(),
                ]);
              })),
    );
  }
}
