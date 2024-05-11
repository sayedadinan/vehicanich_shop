import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/add_more_dialogue.dart';

class CustomAnimatedButton extends StatelessWidget {
  final String buttonText;
  final Bloc bloc;
  final String eventType;

  const CustomAnimatedButton({
    required this.buttonText,
    required this.bloc,
    required this.eventType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      selectedBackgroundColor: Appallcolor().buttonforgroundcolor,
      backgroundColor: Appallcolor().colorblack,
      borderWidth: 3,
      borderColor: Appallcolor().textcolor,
      animationDuration: const Duration(seconds: 1),
      onPress: () {
        showAddMoreDialog(context, bloc, eventType);
      },
      width: Mymediaquery().mediaquerywidth(0.4, context),
      text: buttonText,
      selectedTextColor: Colors.white,
      transitionType: TransitionType.RIGHT_TOP_ROUNDER,
      textStyle: TextStyle(
        fontSize: Mymediaquery().mediaquerywidth(0.04, context),
        letterSpacing: 1,
        color: Appallcolor().textcolor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
