import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich_shop/repositories/shop_reference.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';

class LoginVerification {
  Future<String> verifyLoginDetails() async {
    try {
      final QuerySnapshot querySnapshot = await ShopreferenceId()
          .reference
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
      print('Error verifying login details: $error');
      return 'An error occurred';
    }
  }
}
