import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class ServiceAreaButton extends StatelessWidget {
  final Function(BuildContext) onPressed;
  const ServiceAreaButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Mymediaquery().mediaquerywidth(0.30, context),
        top: Mymediaquery().mediaqueryheight(0.02, context),
      ),
      child: AnimatedButton(
        selectedBackgroundColor: Appallcolor().buttonforgroundcolor,
        backgroundColor: Appallcolor().colorblack,
        borderWidth: 3,
        borderColor: Appallcolor().textcolor,
        animationDuration: const Duration(seconds: 1),
        onPress: () {
          onPressed(context);
        },
        width: Mymediaquery().mediaquerywidth(0.4, context),
        text: 'Add one',
        selectedTextColor: Colors.black,
        transitionType: TransitionType.RIGHT_TOP_ROUNDER,
        textStyle: TextStyle(
          fontSize: Mymediaquery().mediaquerywidth(0.04, context),
          letterSpacing: 1,
          color: Appallcolor().textcolor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
