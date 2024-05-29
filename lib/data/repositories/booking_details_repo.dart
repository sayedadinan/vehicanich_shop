import 'dart:developer';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';

class BookingDetailsUpdation {
  //this is taking the pending details updation which means all pending booking from firebase
  pendingDetailsUpdation(String documentidpassing) async {
    //taking the current user id and passing for updation
    final documentReference = BookingReference()
        .specifiedUserBookingUpdationReference(documentidpassing);
    try {
      //from here this is updating to ispending false then it will remove from pending list
      await documentReference.update(
          {Referencekeys.isPending: false, Referencekeys.isStarted: true});
      //checking for a confirmation
      log('worked this also');
    } catch (e) {
      return 'approve area error $e';
    }
  }

//and making that to inprogress work from here
  pendingDetailsUpdationForStartedButton(String documentidpassing) async {
    //taking the current user id and passing for updation
    final documentReference = BookingReference()
        .specifiedUserBookingUpdationReference(documentidpassing);
    try {
      //from here this is updating to isstarting false then it will remove from starting list
      await documentReference.update(
          {Referencekeys.isStarted: false, Referencekeys.isCompleted: true});
      //checking for a confirmation
      log('worked this also');
    } catch (e) {
      return 'approve area error $e';
    }
  }

// this funtion is changing to completed section
  doneButtonPressedUpdation(String documentidpassing) async {
    //taking the current user id and passing for updation
    final documentReference = BookingReference()
        .specifiedUserBookingUpdationReference(documentidpassing);
    try {
      //from here this is updating to isconpleted false then it will remove from iscompleted list and it will show in history
      await documentReference.update({
        Referencekeys.isStarted: false,
        Referencekeys.isCompleted: false,
        Referencekeys.isPending: false
      });
      //checking for a confirmation
      log('worked this also');
    } catch (e) {
      return 'approve area error $e';
    }
  }
}
