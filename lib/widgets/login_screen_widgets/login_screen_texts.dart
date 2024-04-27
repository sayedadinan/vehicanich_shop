import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vehicanich_shop/screens/register_screen/register_screen.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich_shop/widgets/onboarding_widgets/onboardinng_texts.dart';

class CustomQuestion extends StatelessWidget {
  const CustomQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.10, context),
        ),
        Text(
          "Don't have an account?",
          style: TextStyle(color: Appallcolor().textcolor),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
                FadeTransitionPageRoute(child: const RegisterScreen()));
          },
          child: Text(
            ' Register Now',
            style: TextStyle(color: Appallcolor().buttonforgroundcolor),
          ),
        )
      ],
    );
  }
}

class LoginScreenMainText extends StatelessWidget {
  const LoginScreenMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Myonboardingsmalltext(
          subtitle: '   Welcome back! Glad \nto see you, Again!',
        ),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.14, context),
        )
      ],
    );
  }
}
