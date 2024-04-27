import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/login_bloc/login_bloc.dart';
import 'package:vehicanich_shop/screens/forgot_password/forgot_password.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_custom_button.dart';
import 'package:vehicanich_shop/utils/app_google_button.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/login_screen_widgets/custom_divider.dart';
import 'package:vehicanich_shop/widgets/login_screen_widgets/forgot_button.dart';
import 'package:vehicanich_shop/widgets/login_screen_widgets/login_screen_texts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginBlocState>(
        listener: (context, state) {
          if (state is NavigateToForgetPage) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen()));
          }
        },
        child: Scaffold(
          backgroundColor: Appallcolor().appbackgroundcolor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Mymediaquery().mediaqueryheight(0.2, context)),
                const LoginScreenMainText(),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.05, context)),
                const Inputfield(
                  hinttext: 'Enter your email',
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                const Inputfield(
                  icon: Icon(Icons.remove_red_eye_outlined),
                  hinttext: 'Enter your password',
                ),
                Forgetbutton(
                  function: () =>
                      context.read<LoginBloc>().add(ForgotButtonPressed()),
                ),
                SizedBox(height: Mymediaquery().mediaqueryheight(0.1, context)),
                CustomButton(
                  function: () {},
                  buttontextcolor: Appallcolor().colorwhite,
                  text: 'Login',
                  // function: () =>
                  // context.read<LoginBloc>().add(LoginScreenButtonPressed()),
                  fontSize: Mymediaquery().mediaqueryheight(0.02, context),
                  color: Appallcolor().buttonforgroundcolor,
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.03, context)),
                const CustomDivider(),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.03, context)),
                CustomGoogleButton(
                    bordercolor: Appallcolor().colorwhite,
                    color: Colors.transparent,
                    function: () {},
                    text: 'Login with google',
                    fontSize: Mymediaquery().mediaqueryheight(0.02, context),
                    buttontextcolor: Appallcolor().colorwhite),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.03, context)),
                const CustomQuestion()
              ],
            ),
          ),
        ));
  }
}
