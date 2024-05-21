import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';

class RevenueTotal {
  totalRevenueCount() async {
    final QuerySnapshot snapshot = await ShopreferenceId()
        .shopCollectionReference()
        .doc(FirebaseDatastoring.shopid)
        .collection(Referencekeys.wallet)
        .get();

    // Calculate total revenue
    int totalRevenue = 0;
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      int val = int.parse(doc['money']);
      totalRevenue += val;
    }
    log(totalRevenue);
    // Return total revenue
    return totalRevenue;
  }
}
