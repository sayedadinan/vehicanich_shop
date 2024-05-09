import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';

part 'closing_updation_event.dart';
part 'closing_updation_state.dart';

class ClosingUpdationBloc
    extends Bloc<ClosingUpdationEvent, ClosingUpdationState> {
  ClosingUpdationBloc() : super(ClosingUpdationInitial(clsoingTime: '')) {
    on<ClosingTimeFetching>(closingTimeFetching);
    on<ClosingUpdationTimePicked>(closingUpdationTimePicked);
  }
  closingTimeFetching(
      ClosingTimeFetching event, Emitter<ClosingUpdationState> emit) async {
    try {
      final collection = await CurrentShopCollection().currentShopCollections();
      final shopData = collection;
      final String fromFireBase = shopData[Referencekeys.closingtime];
      emit(ClosingUpdationInitial(clsoingTime: fromFireBase));
    } catch (e) {
      print(e);
    }
  }

  closingUpdationTimePicked(ClosingUpdationTimePicked event,
      Emitter<ClosingUpdationState> emit) async {
    String formattedTime = DateFormat('hh:mm a').format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        event.closingstartingTime.hour,
        event.closingstartingTime.minute,
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
          Referencekeys.closingtime: formattedTime,
        });
        print('Successfully updated starting time');
        emit(ClosingUpdationInitial(clsoingTime: formattedTime));
      } else {
        print('No document found for the phone number: $phone');
      }
    } catch (e) {
      print('Error occurred while updating starting time: $e');
    }
  }
}
