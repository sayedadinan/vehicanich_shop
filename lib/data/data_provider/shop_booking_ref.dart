import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';

class BookingReference {
  CollectionReference<Map<String, dynamic>> allBookingDetails() {
    final shopid = FirebaseDatastoring.shopid;
    final userDocRef = ShopreferenceId()
        .shopCollectionReference()
        .doc(shopid)
        .collection(Referencekeys.newBookings);
    return userDocRef;
  }

  DocumentReference<Map<String, dynamic>>
      specifiedUserBookingUpdationReference() {
    final shopid = FirebaseDatastoring.shopid;
    final userDocRef = ShopreferenceId()
        .shopCollectionReference()
        .doc(shopid)
        .collection(Referencekeys.newBookings)
        .doc();
    return userDocRef;
  }
}
