import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/screens/register_screen/otp_waiting_screen.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';

class FireBasePhoneAuth {
  final FirebaseAuth instance = FirebaseAuth.instance;

  phoneAuthentication(BuildContext context) async {
    final String phoneNumber = "+91${phonecontroller.text.toString()}";
    try {
      print('Trying phone authentication...');

      await instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException exception) {
          print("this is that verification exeption$exception");
        },
        codeSent: (String otpcode, int? resendToken) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OtpWaitingScreen(
                    verificationId: otpcode,
                  )));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phoneNumber,
      );

      print('Phone authentication request sent successfully.');
    } catch (e) {
      print('An error occurred during phone authentication: $e');
      // Handle error here, e.g., show an error message to the user
    }
  }

  verifying(verificationId) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpcontroller.text.toString());
    FirebaseAuth.instance.signInWithCredential(credential);
  }
}
