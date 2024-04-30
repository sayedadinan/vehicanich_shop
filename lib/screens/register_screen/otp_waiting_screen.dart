import 'package:flutter/material.dart';
import 'package:vehicanich_shop/firebase_auth/phoneauth_.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_custom_button.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class OtpWaitingScreen extends StatelessWidget {
  final String verificationId;
  const OtpWaitingScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      appBar: AppBar(
        backgroundColor: Appallcolor().appbackgroundcolor,
        title: Text(
          'Phone Auth',
          style: TextStyle(color: Appallcolor().colorwhite),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: Mymediaquery().mediaqueryheight(0.02, context),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.schedule,
                color: Appallcolor().colorwhite,
                size: Mymediaquery().mediaquerywidth(0.15, context))
          ]),
          Text(
            'wait for your otp it will send now ',
            style: TextStyle(
                color: Appallcolor().colorwhite,
                fontSize: Mymediaquery().mediaquerywidth(0.02, context)),
          ),
          SizedBox(
            height: Mymediaquery().mediaqueryheight(0.02, context),
          ),
          Text(
            'Your otp will send to your phone',
            style: TextStyle(
                color: Appallcolor().colorwhite,
                fontSize: Mymediaquery().mediaquerywidth(0.03, context)),
          ),
          SizedBox(
            height: Mymediaquery().mediaqueryheight(0.02, context),
          ),
          Inputfield(
            hinttext: '',
            controller: otpcontroller,
          ),
          SizedBox(
            height: Mymediaquery().mediaqueryheight(0.04, context),
          ),
          CustomButton(
              color: Appallcolor().buttonforgroundcolor,
              function: () {
                FireBasePhoneAuth().verifying(verificationId, context);
              },
              text: 'Enter',
              fontSize: Mymediaquery().mediaquerywidth(0.03, context),
              buttontextcolor: Appallcolor().colorwhite)
        ],
      ),
    );
  }
}
