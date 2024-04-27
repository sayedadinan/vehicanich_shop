import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/onboarding_widgets/onboardinng_texts.dart';

class MainText extends StatelessWidget {
  final String text;
  const MainText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Myonboardingsmalltext(
          subtitle: text,
        ),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.18, context),
        )
      ],
    );
  }
}

class Smallheading extends StatelessWidget {
  final String text;
  final double width;
  const Smallheading({super.key, required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Myonboardingsmalltext(
          subtitle: text,
        ),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(width, context),
        )
      ],
    );
  }
}

class HintText extends StatelessWidget {
  final String text;
  final double size;
  const HintText({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Mymediaquery().mediaquerywidth(size, context),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: Mymediaquery().mediaquerywidth(0.02, context),
              color: Appallcolor().textcolor),
        ),
      ],
    );
  }
}
