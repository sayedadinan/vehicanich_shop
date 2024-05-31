import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/search_bloc/bloc/search_bloc.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/data/services/connectivity/internet_connection.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/app_search_bar.dart';
import 'package:vehicanich_shop/widgets/connectivity_widget/connectivity_screen.dart';
import 'package:vehicanich_shop/widgets/home_widgets/first_home_screen/list_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Appallcolor().appbackgroundcolor,
        body: StreamBuilder(
            stream: checkInternetConnection(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData || !snapshot.data!) {
                return const ConnectivityWidget();
              }
              return Column(
                children: [
                  CustomSearchField(),
                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is SearchInitial) {
                        return StreamBuilder<QuerySnapshot>(
                          stream: BookingReference()
                              .allBookingDetails()
                              .where(Referencekeys.ordered, isEqualTo: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return loader;
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData) {
                              return const Text('No data available');
                            } else {
                              var bookings = snapshot.data!.docs;
                              if (state.query.isNotEmpty) {
                                bookings = bookings.where((booking) {
                                  var vehicleNumber =
                                      booking[Referencekeys.vahicleNumber]
                                          .toString()
                                          .toLowerCase();
                                  return vehicleNumber
                                      .contains(state.query.toLowerCase());
                                }).toList();
                              }
                              // Display all shops
                              return bookings.isEmpty
                                  ? const Text(
                                      'No shops found matching your search')
                                  : ListViewForCompletedList(
                                      bookingDetails: bookings,
                                    );
                            }
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
