import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_fonts.dart';
import 'package:vehicanich_shop/utils/app_text.dart';

class RatingsAndReviews extends StatelessWidget {
  const RatingsAndReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        title: const AppText(
            text: 'Ratings and Reviews', size: 0.06, fontFamily: 'Noto Serif'),
        backgroundColor: Appallcolor().appbarbackgroundcolor,
      ),
      body: Center(
        child: AppText(
            text: 'Ratings and Reviews will update soon',
            size: 0.05,
            fontFamily: AppFonts.headText),
      ),
    );
  }
}
