import 'package:cloud_firestore/cloud_firestore.dart';

class ShopreferenceId {
  final CollectionReference reference =
      FirebaseFirestore.instance.collection('shop_details');
}
