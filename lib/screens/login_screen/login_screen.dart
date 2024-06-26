import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/login_bloc/login_bloc.dart';
import 'package:vehicanich_shop/screens/forgot_password/forgot_password.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_custom_button.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';
import 'package:vehicanich_shop/utils/app_validators.dart';
import 'package:vehicanich_shop/utils/bottom_navigation/bottom_list.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/login_screen_widgets/custom_divider.dart';
import 'package:vehicanich_shop/widgets/login_screen_widgets/login_screen_texts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginBlocState>(listener: (context, state) {
      if (state is NavigateToForgetPage) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ForgotPasswordScreen()));
      }
      if (state is LoginSuccess) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomBar()),
            (route) => false);
      }
    }, builder: (context, state) {
      if (state is LoginLoading) {
        return Center(
          child: loader,
        );
      }
      return Scaffold(
        backgroundColor: Appallcolor().appbackgroundcolor,
        body: SingleChildScrollView(
          child: Form(
            key: loginKey,
            child: Column(
              children: [
                CustomSizedBoxHeight(0.20),
                const LoginScreenMainText(),
                CustomSizedBoxHeight(0.05),
                Inputfield(
                  keyboardType: TextInputType.phone,
                  controller: loginphonecontroller,
                  hinttext: 'Enter your phone',
                  validator: (value) => Validators().validatePhoneNumber(value),
                ),
                CustomSizedBoxHeight(0.02),
                Inputfield(
                  controller: loginpasswordcontroller,
                  hinttext: 'Enter your password',
                  validator: (value) => Validators().validatePassword(value),
                ),
                CustomSizedBoxHeight(0.01),
                CustomSizedBoxHeight(0.06),
                CustomButton(
                  function: () {
                    log('worked');
                    context.read<LoginBloc>().add(LoginScreenButtonPressed(
                        formkey: loginKey, context: context));
                  },
                  buttontextcolor: Appallcolor().colorwhite,
                  text: 'Login',
                  fontSize: Mymediaquery().mediaqueryheight(0.02, context),
                  color: Appallcolor().buttonforgroundcolor,
                ),
                CustomSizedBoxHeight(0.03),
                const CustomDivider(),
                CustomSizedBoxHeight(0.03),
                const CustomQuestion()
              ],
            ),
          ),
        ),
      );
    });
  }
}
