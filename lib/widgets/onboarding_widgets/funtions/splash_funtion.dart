import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
import 'package:vehicanich_shop/screens/login_screen/login_screen.dart';
import 'package:vehicanich_shop/screens/onboarding_screen/login_or_sign.dart';
import 'package:vehicanich_shop/screens/onboarding_screen/onboarding_screen.dart';
import 'package:vehicanich_shop/screens/waiting_screen/rejected_screen.dart';
import 'package:vehicanich_shop/screens/waiting_screen/waiting_screen.dart';
import 'package:vehicanich_shop/utils/bottom_navigation/bottom_list.dart';

Future<void> checkingforsplash(context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final initialUser = preferences.getBool(Referencekeys.initialEntry);
  log('this $initialUser');
  if (initialUser == null) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
      (Route<dynamic> route) => false,
    );
  } else {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(Referencekeys.shopPhone);

    log('this phone for $data');
    log('this $initialUser');
    await Future.delayed(const Duration(seconds: 2));
    if (data == null) {
      log('data null worked');
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginOrsign()),
        (Route<dynamic> route) => false,
      );
      return;
    } else if (data.isEmpty) {
      log('data isEmpty worked');
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    } else {
      userRegisteredOrNotChecking(data, context);
    }
  }
}

userRegisteredOrNotChecking(String phone, context) async {
  final collection = ShopreferenceId()
      .shopCollectionReference()
      .where(Referencekeys.phone, isEqualTo: phone);
  log('this is from splash $collection');
  final snapshot = await collection.get();
  if (snapshot.docs.isNotEmpty) {
    final existingData = snapshot.docs.first.data();

    if (existingData[Referencekeys.isApproved]) {
      log('accepted');
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BottomBar()),
        (Route<dynamic> route) => false,
      );
      return;
    } else if (existingData[Referencekeys.isRejected]) {
      log('rejected');
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const RejectedScreen()),
        (Route<dynamic> route) => false,
      );
    } else if (!existingData[Referencekeys.isApproved]) {
      log('nothing');
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const WaitingScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }
}

// userCheckingForOnboarding() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
// }
