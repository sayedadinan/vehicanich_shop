import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';

class LoginVerification {
  Future<String> verifyLoginDetails() async {
    try {
      final QuerySnapshot querySnapshot = await ShopreferenceId()
          .shopCollectionReference()
          .where('phone', isEqualTo: loginphonecontroller.text)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return 'User does not exist';
      }
      final DocumentSnapshot userDoc = querySnapshot.docs.first;

      if (userDoc['password'] != loginpasswordcontroller.text) {
        return 'Password is incorrect';
      }
      return 'Login successful';
    } catch (error) {
      log('Error verifying login details: $error');
      return 'An error occurred';
    }
  }

  userLogoutfun() async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
