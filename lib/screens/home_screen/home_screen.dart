import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appallcolor().appbarbackgroundcolor,
      ),
      body: Center(
        child: Text(
          '      waiting for showing datas here\notp verified and entered to home screen',
          style: TextStyle(
              color: Appallcolor().colorwhite,
              fontSize: Mymediaquery().mediaquerywidth(0.02, context)),
        ),
      ),
      backgroundColor: Appallcolor().appbackgroundcolor,
    );
  }
}
