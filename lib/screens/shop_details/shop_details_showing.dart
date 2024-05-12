import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_bar_text.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/page_transition/page_slide_transition.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/service_updations/body_service_updation.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/service_updations/engine_service_updation.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/service_updations/interior_service.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/shop_details_updation.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/time_updations/closing_time_updation.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/time_updations/starting_time_updation.dart';

class ShopDetailPage extends StatelessWidget {
  const ShopDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appallcolor().appbarbackgroundcolor,
        title: const AppbarText(text: 'shop details'),
      ),
      body: Column(
        children: [
          CustomSizedBoxHeight(0.06),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    SlideTransitionPageRoute(child: const BodyUpdation()));
              },
              child: const ServiceContainers(
                  text: 'Body Maintenance and Repair      ')),
          CustomSizedBoxHeight(0.03),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    SlideTransitionPageRoute(child: const InteriorUpdation()));
              },
              child: const ServiceContainers(
                  text: 'Interior Service and clean              ')),
          CustomSizedBoxHeight(0.03),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    SlideTransitionPageRoute(child: const EngineUpdation()));
              },
              child: const ServiceContainers(
                  text: 'Engine and Mechanichal Services')),
          CustomSizedBoxHeight(0.03),
          const StartingTimeUpdationContainer(),
          CustomSizedBoxHeight(0.03),
          const ClosingTimeUpdationContainer()
        ],
      ),
    );
  }
}
