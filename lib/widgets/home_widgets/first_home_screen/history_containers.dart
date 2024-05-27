import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicanich_shop/screens/history_screen/history_screen.dart';
import 'package:vehicanich_shop/screens/home_screen/home_screen.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_slide_transition.dart';

class CustomContainerForFirstHome extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color iconColor;
  final Color containerColor;
  const CustomContainerForFirstHome({
    Key? key,
    required this.iconData,
    required this.text,
    required this.iconColor,
    required this.containerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: containerColor,
      ),
      width: Mymediaquery().mediaquerywidth(0.43, context),
      height: Mymediaquery().mediaqueryheight(0.15, context),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: Mymediaquery().mediaqueryheight(0.02, context),
            ),
            Icon(
              iconData,
              size: Mymediaquery().mediaquerywidth(0.17, context),
              color: iconColor,
            ),
            SizedBox(
              height: Mymediaquery().mediaqueryheight(0.001, context),
            ),
            Text(
              text,
              style: GoogleFonts.quicksand().copyWith(
                fontSize: Mymediaquery().mediaquerywidth(0.05, context),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentStatusContainer extends StatelessWidget {
  const CurrentStatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(SlideTransitionPageRoute(child: const HomeScreen()));
          },
          child: CustomContainerForFirstHome(
            containerColor: Appallcolor().listcontainer,
            iconColor: Appallcolor().colorwhite,
            iconData: Icons.pending_outlined,
            text: 'Current',
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(SlideTransitionPageRoute(child: const HistoryScreen()));
          },
          child: CustomContainerForFirstHome(
            containerColor: Appallcolor().listcontainer,
            iconColor: Appallcolor().colorwhite,
            iconData: Icons.history,
            text: 'History',
          ),
        ),
      ],
    );
  }
}
