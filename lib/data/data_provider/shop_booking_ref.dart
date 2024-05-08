import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  DocumentReference<Map<String, dynamic>> specifiedUserBookingUpdationReference(
      String id) {
    final shopid = FirebaseDatastoring.shopid;
    final userDocRef = ShopreferenceId()
        .shopCollectionReference()
        .doc(shopid)
        .collection(Referencekeys.newBookings)
        .doc(id);
    print('this is from funtion $userDocRef');
    return userDocRef;
  }
}

class CurrentShopCollection {
  currentShopCollections() async {
    final pref = await SharedPreferences.getInstance();
    final phone = pref.getString(Referencekeys.shopPhone);
    if (phone == null || phone.isEmpty) {
      return;
    }
    final collection = await ShopreferenceId()
        .shopCollectionReference()
        .where(Referencekeys.phone, isEqualTo: phone)
        .get();
    return collection.docs.first;
  }

  currentShopCollectionReference() async {
    final pref = await SharedPreferences.getInstance();
    final phone = pref.getString(Referencekeys.shopPhone);
    if (phone == null || phone.isEmpty) {
      return;
    }
    final collection = ShopreferenceId()
        .shopCollectionReference()
        .where(Referencekeys.phone, isEqualTo: phone);
    return collection;
  }
}
