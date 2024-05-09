import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
part 'starting_time_updation_event.dart';
part 'starting_time_updation_state.dart';

class StartingTimeUpdationBloc
    extends Bloc<StartingTimeUpdationEvent, StartingTimeUpdationState> {
  StartingTimeUpdationBloc()
      : super(StartingTimeUpdationInitial(startingTime: '')) {
    on<StartingTimeFetching>(startingTimeFetching);
    on<StartingUpdationTimePicked>(startingUpdationTimePicked);
  }
  startingTimeFetching(StartingTimeFetching event,
      Emitter<StartingTimeUpdationState> emit) async {
    try {
      final collection = await CurrentShopCollection().currentShopCollections();
      final shopData = collection;
      final String fromFireBase = shopData[Referencekeys.startingtime];
      emit(StartingTimeUpdationInitial(startingTime: fromFireBase));
    } catch (e) {
      print(e);
    }
  }

  startingUpdationTimePicked(StartingUpdationTimePicked event,
      Emitter<StartingTimeUpdationState> emit) async {
    String formattedTime = DateFormat('hh:mm a').format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        event.selectedstartingTime.hour,
        event.selectedstartingTime.minute,
      ),
    );
    try {
      final pref = await SharedPreferences.getInstance();
      final phone = pref.getString(Referencekeys.shopPhone);
      if (phone == null || phone.isEmpty) {
        return;
      }
      final collection = ShopreferenceId()
          .shopCollectionReference()
          .where(Referencekeys.phone, isEqualTo: phone);
      final snapshot = await collection.get();
      if (snapshot.docs.isNotEmpty) {
        final docId = snapshot.docs.first.id;
        await ShopreferenceId().shopCollectionReference().doc(docId).update({
          Referencekeys.startingtime: formattedTime,
        });
        print('Successfully updated starting time');
        emit(StartingTimeUpdationInitial(startingTime: formattedTime));
      } else {
        print('No document found for the phone number: $phone');
      }
    } catch (e) {
      print('Error occurred while updating starting time: $e');
    }
  }
}
