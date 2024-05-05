import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';

class ShopreferenceId {
  CollectionReference<Map<String, dynamic>> shopCollectionReference() {
    final shopcollectionReference =
        FirebaseFirestore.instance.collection(Referencekeys.shopdetails);
    return shopcollectionReference;
  }
}
