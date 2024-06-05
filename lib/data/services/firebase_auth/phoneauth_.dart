import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/repositories/shop_details_firebase_service.dart';
import 'package:vehicanich_shop/screens/register_screen/otp_waiting_screen.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';

class FireBasePhoneAuth {
  final FirebaseAuth instance = FirebaseAuth.instance;

  Future<void> phoneAuthentication(BuildContext context) async {
    final String phoneNumber = "+91${phonecontroller.text.toString()}";

    try {
      print('Trying phone authentication...');

      await instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          print('Verification completed automatically.');
        },
        verificationFailed: (FirebaseAuthException exception) {
          // Handle the error when verification fails.
          Navigator.pop(context);
          final snackBar = SnackBar(
            padding: const EdgeInsets.all(26),
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Oops',
              message:
                  exception.message ?? "An error occurred. Try again later.",
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);

          print('Verification failed: ${exception.message}');
        },
        codeSent: (String otpcode, int? resendToken) {
          // This callback is invoked when an OTP is sent.
          print('OTP code sent.');
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OtpWaitingScreen(
                    verificationId: otpcode,
                  )));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // This callback is invoked when the auto-retrieval time-out occurs.
          print('Auto-retrieval timeout.');
        },
      );

      print('Phone authentication request sent successfully.');
    } catch (e) {
      print('An error occurred during phone authentication: $e');
      final snackBar = SnackBar(
        padding: const EdgeInsets.all(26),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error',
          message: 'An unexpected error occurred. Please try again later.',
          contentType: ContentType.failure,
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  verifyingAndAddingToFireBase(verificationId, BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpcontroller.text.toString());
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() async {
      await ShopDetailsFirebaseService().addShopDetailsToFirebase(context);
    });
  }
}
