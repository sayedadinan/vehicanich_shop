import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/registration_button_bloc/bloc/registration_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_custom_button.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';

import 'package:vehicanich_shop/utils/app_validators.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class OtpWaitingScreen extends StatelessWidget {
  final String verificationId;

  const OtpWaitingScreen({Key? key, required this.verificationId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<FormState> otpKey = GlobalKey<FormState>();

    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        if (state is OtpScreenLoading) {
          return Center(
            child: loader,
          );
        } else {
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
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Appallcolor().colorwhite,
                        size: Mymediaquery().mediaquerywidth(0.25, context),
                      )
                    ],
                  ),
                  SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.08, context)),
                  Text(
                    'Wait for your OTP, it will be sent shortly.',
                    style: TextStyle(
                      color: Appallcolor().colorwhite,
                      fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your OTP will be sent to your phone.',
                    style: TextStyle(
                      color: Appallcolor().colorwhite,
                      fontSize: Mymediaquery().mediaquerywidth(0.05, context),
                    ),
                  ),
                  SizedBox(height: 20),
                  Inputfield(
                    hinttext: 'enter your otp',
                    validator: (value) => Validators().validateText(value),
                    controller: otpcontroller,
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    buttontextcolor: Colors.black,
                    color: Appallcolor().buttonforgroundcolor,
                    fontSize: Mymediaquery().mediaquerywidth(0.05, context),
                    function: () {
                      context.read<RegistrationBloc>().add(
                            SubmitOtpButtonPressed(
                              context: context,
                              // otpkey: otpKey,
                              // verificationId: verificationId,
                            ),
                          );
                    },
                    text: 'submit otp',
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
