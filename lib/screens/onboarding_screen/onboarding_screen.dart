import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/onboarding_bloc/onboarding_bloc.dart';
import 'package:vehicanich_shop/screens/onboarding_screen/login_or_sign.dart';
import 'package:vehicanich_shop/screens/onboarding_screen/onboarding_items.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich_shop/widgets/onboarding_widgets/onboarding_image.dart';
import 'package:vehicanich_shop/widgets/onboarding_widgets/onboarding_smoothindicator.dart';
import 'package:vehicanich_shop/widgets/onboarding_widgets/onboardinng_texts.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final controller = OnboardingItems();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingBlocState>(
        listener: (context, state) {
          if (state is NavigatetosecondOnboardingPage) {
            pageController.nextPage(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeIn);
          }
          if (state is NavigatetoLoginorSignPage) {
            Navigator.of(context)
                .push(FadeTransitionPageRoute(child: const LoginOrsign()));
          }
        },
        child: Scaffold(
          bottomSheet: Smoothindicatorwithbutton(
            controller: controller,
            pageController: pageController,
          ),
          backgroundColor: Appallcolor().appbackgroundcolor,
          body: PageView.builder(
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.1, context)),
                    Myonboardmaintitle(
                      size: Mymediaquery().mediaquerywidth(0.06, context),
                      title: controller.items[index].title,
                      textcolor: Appallcolor().textcolor,
                    ),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.05, context)),
                    Onboardingfirstimage(path: controller.items[index].image),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.09, context)),
                    Myonboardingsmalltext(
                        subtitle: controller.items[index].subtitle)
                  ],
                );
              },
              controller: pageController),
        ));
  }
}
