import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/login_bloc/login_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_custom_button.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/forgot_screen_widgets/custom_question.dart';
import 'package:vehicanich_shop/widgets/forgot_screen_widgets/fogot_text.dart';

class OtpverificationPage extends StatelessWidget {
  const OtpverificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: Column(
        children: [
          SizedBox(height: Mymediaquery().mediaqueryheight(0.2, context)),
          ForgotPageText(
              text: 'OTP Verification',
              fontsize: Mymediaquery().mediaquerywidth(0.04, context),
              fontweight: FontWeight.w600),
          SizedBox(height: Mymediaquery().mediaqueryheight(0.01, context)),
          ForgotPageText(
              text:
                  "Enter the verification code we just sent on your\nemail address.",
              fontsize: Mymediaquery().mediaquerywidth(0.02, context),
              fontweight: FontWeight.w400),
          SizedBox(height: Mymediaquery().mediaqueryheight(0.07, context)),
          // OTPTextField(
          //     length: 4,
          //     onChanged: (value) {
          //       print('OTP: $value');
          //     }),
          SizedBox(height: Mymediaquery().mediaqueryheight(0.03, context)),
          CustomButton(
              color: Appallcolor().buttonforgroundcolor,
              function: () =>
                  context.read<LoginBloc>().add(VerifyButtonPressed()),
              text: 'Verify',
              fontSize: Mymediaquery().mediaquerywidth(0.02, context),
              buttontextcolor: Appallcolor().colorwhite),
          SizedBox(height: Mymediaquery().mediaqueryheight(0.359, context)),
          const Customquestion()
        ],
      ),
    );
  }
}
