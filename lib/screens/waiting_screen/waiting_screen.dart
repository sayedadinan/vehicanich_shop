import 'package:flutter/material.dart';
import 'package:vehicanich_shop/screens/home_screen/home_screen.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
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
              height: Mymediaquery().mediaqueryheight(0.19, context),
            ),
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.90, context),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                    color: Appallcolor().colorwhite,
                  ),
                  children: const [
                    TextSpan(
                      text:
                          "Thank you for submitting your request to join our platform. We've received your application and it's currently under review by our admin team. We want you to know that we deeply value your interest in joining us. Once your application is ",
                    ),
                    TextSpan(
                      text: "approved",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          ", you'll gain access to a vibrant community of users and customers eager to connect with you. Your journey with us will be filled with exciting opportunities to grow your business and reach new heights. We appreciate your patience.",
                    ),
                    TextSpan(
                      text:
                          " If your application is not approved within 24 hours, please contact our team via email. You can find the email address on our Play Store page.",
                    ),
                  ],
                ),
              ),
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
