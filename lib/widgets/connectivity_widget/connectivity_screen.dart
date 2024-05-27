import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_fonts.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/app_text.dart';

class ConnectivityWidget extends StatelessWidget {
  const ConnectivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: Column(
        children: [
          CustomSizedBoxHeight(0.16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 0.5,
                child: Image.asset(
                  'assets/images/none_networkImage.png',
                ),
              ),
            ],
          ),
          AppText(
            text: 'Oops ! some thing went wrong',
            size: 0.06,
            fontFamily: AppFonts.headText,
          ),
          AppText(
            text: 'please check your internet connection',
            size: 0.04,
            fontFamily: AppFonts.normalText,
          )
        ],
      ),
    );
  }
}
