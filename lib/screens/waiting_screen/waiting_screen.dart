import 'package:flutter/material.dart';
import 'package:vehicanich_shop/screens/home_screen/home_screen.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich_shop/utils/page_transition/page_slide_transition.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            Navigator.push(
                context, SlideTransitionPageRoute(child: const HomeScreen()));
          },
        ),
        backgroundColor: Appallcolor().appbarbackgroundcolor,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: Mymediaquery().mediaqueryheight(0.24, context),
            ),
            Text(
              " Thank you for submitting your request to join our platform. Your application is currently under review by our admin team. Once approved, you'll be able to start communicating with users and customers. We appreciate your patience and look forward to having you onboard!",
              style: TextStyle(
                  color: Appallcolor().colorwhite,
                  fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
            ),
            SizedBox(
              child: Image.asset('assets/images/Exchange validation.png'),
            )
          ],
        ),
      ),
      backgroundColor: Appallcolor().appbackgroundcolor,
    );
  }
}
