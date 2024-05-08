import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';

class BookingDetailsUpdation {
  pendingDetailsUpdation(String documentidpassing) async {
    final documentReference = BookingReference()
        .specifiedUserBookingUpdationReference(documentidpassing);
    try {
      await documentReference.update(
          {Referencekeys.isPending: false, Referencekeys.isStarted: true});
      print('worked this also');
    } catch (e) {
      return 'approve area error $e';
    }
  }

  pendingDetailsUpdationForStartedButton(String documentidpassing) async {
    final documentReference = BookingReference()
        .specifiedUserBookingUpdationReference(documentidpassing);
    try {
      await documentReference.update(
          {Referencekeys.isStarted: false, Referencekeys.isCompleted: true});
      print('worked this also');
    } catch (e) {
      return 'approve area error $e';
    }
  }
}
