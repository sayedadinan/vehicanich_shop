import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
import 'package:vehicanich_shop/screens/login_screen/login_screen.dart';
import 'package:vehicanich_shop/screens/onboarding_screen/login_or_sign.dart';
import 'package:vehicanich_shop/screens/waiting_screen/rejected_screen.dart';
import 'package:vehicanich_shop/screens/waiting_screen/waiting_screen.dart';
import 'package:vehicanich_shop/utils/bottom_navigation/bottom_list.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';

Future<void> checkingforsplash(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final data = prefs.getString(Referencekeys.shopPhone);

  await Future.delayed(const Duration(seconds: 2));

  if (data == null) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginOrsign()),
      (Route<dynamic> route) => false,
    );
    return;
  } else if (data.isEmpty) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  } else {
    userRegisteredOrNotChecking(data, context);
  }
}

userRegisteredOrNotChecking(String phone, context) async {
  final collection = ShopreferenceId()
      .shopCollectionReference()
      .where(Referencekeys.phone, isEqualTo: phone);
  final snapshot = await collection.get();
  if (snapshot.docs.isNotEmpty) {
    final existingData = snapshot.docs.first.data();
    if (existingData[Referencekeys.isApproved]) {
      Navigator.of(context).push(FadeTransitionPageRoute(child: BottomBar()));
      return;
    } else if (existingData[Referencekeys.isRejected]) {
      Navigator.of(context)
          .push(FadeTransitionPageRoute(child: const RejectedScreen()));
    } else if (!existingData[Referencekeys.isApproved]) {
      Navigator.of(context)
          .push(FadeTransitionPageRoute(child: const WaitingScreen()));
    }
  }
}