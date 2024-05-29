// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';

class ShopIdService {
  //shop id taking with phone number

  getShopId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final phone = prefs.getString(Referencekeys.shopPhone);
    print('this one phone $phone');
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ShopreferenceId()
        .shopCollectionReference()
        .where('phone', isEqualTo: phone)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      print(querySnapshot.docs.first.id);
      return querySnapshot.docs.first.id;
    } else {
      print("No matching documents found");
      return null;
    }
  }
}

class SharedPreferencesService {
  //stoing phone number to sharedpreference

  Future<void> saveShopPhoneToSharedPreferences(String phone) async {
    print(phone);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Referencekeys.shopPhone, phone);
  }
}
