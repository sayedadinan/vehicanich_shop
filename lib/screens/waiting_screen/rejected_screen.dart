import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class RejectedScreen extends StatelessWidget {
  const RejectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Appallcolor().appbarbackgroundcolor),
      body: Center(
        child: Column(
          children: [
            CustomSizedBoxHeight(0.10),
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
                                "We regret to inform you that your application to join our platform has been "),
                        TextSpan(
                          text: "rejected",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: " due to some ",
                        ),
                        TextSpan(
                          text: "validation issues",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              " with your shop. Upon further inspection, we encountered difficulties when searching for your shop, which unfortunately led to the decision to reject your request at this time.",
                        ),
                      ],
                    ),
                  ),
                  CustomSizedBoxHeight(0.04),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                        color: Appallcolor().colorwhite,
                      ),
                      children: const [
                        TextSpan(
                          text:
                              "We understand this may be disappointing news, but please know that we're here to assist you. You can contact our ",
                        ),
                        TextSpan(
                          text: "management team",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " or ",
                        ),
                        TextSpan(
                          text: "customer support",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                " for further clarification or assistance. You can reach out to them via phone or email:")
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
