import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/onboarding_bloc/onboarding_bloc.dart';
import 'package:vehicanich_shop/screens/login_screen/login_screen.dart';
import 'package:vehicanich_shop/screens/register_screen/register_screen.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_custom_button.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich_shop/widgets/onboarding_widgets/onboardinng_texts.dart';

class LoginOrsign extends StatelessWidget {
  const LoginOrsign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingBlocState>(
        listener: (context, state) {
          if (state is NavigatetoLoginPage) {
            Navigator.of(context)
                .push(FadeTransitionPageRoute(child: LoginScreen()));
          }
          if (state is Navigatetosignpage) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
          }
        },
        child: Scaffold(
          backgroundColor: Appallcolor().appbackgroundcolor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Mymediaquery().mediaqueryheight(0.2, context),
              ),
              Row(
                children: [
                  SizedBox(
                    width: Mymediaquery().mediaquerywidth(0.18, context),
                  ),
                  Myonboardmaintitle(
                    size: Mymediaquery().mediaquerywidth(0.05, context),
                    textcolor: Appallcolor().colorwhite,
                    title: 'VEHII',
                  ),
                ],
              ),
              Myonboardmaintitle(
                size: Mymediaquery().mediaquerywidth(0.06, context),
                textcolor: Appallcolor().colorwhite,
                title: 'Canich',
              ),
              SizedBox(
                height: Mymediaquery().mediaqueryheight(0.2, context),
              ),
              const Loginorsigntext(),
              SizedBox(
                height: Mymediaquery().mediaqueryheight(0.1, context),
              ),
              CustomButton(
                buttontextcolor: Appallcolor().colorwhite,
                text: 'Login',
                function: () =>
                    context.read<OnboardingBloc>().add(LoginButtonPressed()),
                fontSize: Mymediaquery().mediaqueryheight(0.02, context),
                color: Appallcolor().textcolor,
              ),
              SizedBox(
                height: Mymediaquery().mediaqueryheight(0.02, context),
              ),
              CustomButton(
                buttontextcolor: Appallcolor().colorwhite,
                text: 'Register',
                function: () =>
                    context.read<OnboardingBloc>().add((Signinbuttonpressed())),
                fontSize: Mymediaquery().mediaqueryheight(0.02, context),
                color: Appallcolor().buttonforgroundcolor,
              ),
            ],
          ),
        ));
  }
}
