import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';

class BookingDetailsUpdation {
  pendingDetailsUpdation(String documentidpassing) async {
    final documentReference =
        BookingReference().specifiedUserBookingUpdationReference();
    try {
      await documentReference.update({Referencekeys.isPending: false});
    } catch (e) {
      return 'approve area error $e';
    }
  }
}
