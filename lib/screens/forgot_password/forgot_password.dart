import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/login_bloc/login_bloc.dart';
import 'package:vehicanich_shop/screens/forgot_password/otp_screen.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_custom_button.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/forgot_screen_widgets/fogot_text.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginBlocState>(
        listener: (context, state) {
          if (state is NavigateToOtpPage) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const OtpverificationPage()));
          }
        },
        child: Scaffold(
          backgroundColor: Appallcolor().appbackgroundcolor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Mymediaquery().mediaqueryheight(0.2, context)),
                ForgotPageText(
                  text: 'Forgot Password?',
                  fontsize: Mymediaquery().mediaquerywidth(0.04, context),
                  fontweight: FontWeight.w600,
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.01, context)),
                ForgotPageText(
                  text:
                      "Don't worry! It occurs. Please enter the email\naddress linked with your account.",
                  fontsize: Mymediaquery().mediaquerywidth(0.02, context),
                  fontweight: FontWeight.w400,
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.07, context)),
                const Inputfield(
                  label: 'Enter your phone',
                  hinttext: '',
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.04, context)),
                CustomButton(
                  color: Appallcolor().buttonforgroundcolor,
                  buttontextcolor: Appallcolor().colorwhite,
                  fontSize: Mymediaquery().mediaqueryheight(0.02, context),
                  function: () =>
                      context.read<LoginBloc>().add(SendcodeButtonPressed()),
                  text: 'Send Code',
                ),
              ],
            ),
          ),
        ));
  }
}
