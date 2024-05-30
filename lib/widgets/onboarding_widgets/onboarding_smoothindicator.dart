import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vehicanich_shop/blocs/onboarding_bloc/onboarding_bloc.dart';
import 'package:vehicanich_shop/screens/onboarding_screen/onboarding_items.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class Smoothindicatorwithbutton extends StatelessWidget {
  const Smoothindicatorwithbutton(
      {super.key, required this.pageController, required this.controller});
  final PageController pageController;
  final OnboardingItems controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Mymediaquery().mediaquerywidth(0.01, context),
          right: Mymediaquery().mediaquerywidth(0.13, context),
          bottom: Mymediaquery().mediaqueryheight(0.07, context)),
      color: Appallcolor().appbackgroundcolor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: Mymediaquery().mediaquerywidth(0.01, context)),
          Padding(
            padding: EdgeInsets.only(
              bottom: Mymediaquery().mediaqueryheight(0.01, context),
            ),
            child: SmoothPageIndicator(
                controller: pageController,
                count: controller.items.length,
                effect: JumpingDotEffect(
                    activeDotColor: Appallcolor().buttonforgroundcolor)),
          ),
          SizedBox(
            width: Mymediaquery().mediaquerywidth(0.20, context),
          ),
          InkWell(
            onTap: () async {
              context
                  .read<OnboardingBloc>()
                  .add(NextButtonPressed(pageController.page!));
            },
            child: Container(
              width: Mymediaquery().mediaquerywidth(0.17, context),
              height: Mymediaquery().mediaqueryheight(0.07, context),
              decoration: BoxDecoration(
                  color: Appallcolor().buttonforgroundcolor,
                  borderRadius: BorderRadius.circular(18)),
              child: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          )
        ],
      ),
    );
  }
}
