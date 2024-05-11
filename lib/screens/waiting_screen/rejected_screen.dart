import 'package:flutter/material.dart';
import 'package:vehicanich_shop/screens/home_screen/home_screen.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_slide_transition.dart';

class RejectedScreen extends StatelessWidget {
  const RejectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // FirebaseDatastoring().bookingDetailsGetting();
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
              height: Mymediaquery().mediaqueryheight(0.10, context),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Mymediaquery().mediaquerywidth(0.20, context)),
              child: SizedBox(
                child: Image.asset('assets/images/error_image.png'),
              ),
            ),
            SizedBox(
              width: Mymediaquery().mediaquerywidth(0.90, context),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                        color: Appallcolor().colorwhite,
                      ),
                      children: const [
                        TextSpan(
                          text:
                              "We regret to inform you that your application to join our platform has been ",
                        ),
                        TextSpan(
                          text: "rejected",
                          style: TextStyle(
                            color: Colors.red, // Highlight rejected in red
                            fontWeight: FontWeight
                                .bold, // Optionally, you can make it bold
                          ),
                        ),
                        TextSpan(
                          text: " due to some ",
                        ),
                        TextSpan(
                          text: "validation issues",
                          style: TextStyle(
                            color: Colors
                                .red, // Highlight validation issues in red
                            fontWeight: FontWeight
                                .bold, // Optionally, you can make it bold
                          ),
                        ),
                        TextSpan(
                          text:
                              " with your shop. Upon further inspection, we encountered difficulties when searching for your shop, which unfortunately led to the decision to reject your request at this time.",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.04, context),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                        color: Appallcolor().colorwhite,
                      ),
                      children:const [
                        TextSpan(
                          text:
                              "We understand this may be disappointing news, but please know that we're here to assist you. You can contact our ",
                        ),
                        TextSpan(
                          text: "management team",
                          style: TextStyle(
                            color:
                                Colors.red, // Highlight management team in red
                            fontWeight: FontWeight
                                .bold, // Optionally, you can make it bold
                          ),
                        ),
                        TextSpan(
                          text: " or ",
                        ),
                        TextSpan(
                          text: "customer support",
                          style: TextStyle(
                            color:
                                Colors.red, // Highlight customer support in red
                            fontWeight: FontWeight
                                .bold, // Optionally, you can make it bold
                          ),
                        ),
                        TextSpan(
                          text:
                              " for further clarification or assistance. You can reach out to them via phone or email:",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Appallcolor().appbackgroundcolor,
    );
  }
}
