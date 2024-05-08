import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_bar_text.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_slide_transition.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/service_updations/body_service_updation.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/service_updations/interior_service.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/shop_details_updation.dart';

class ShopDetailPage extends StatelessWidget {
  const ShopDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appallcolor().appbarbackgroundcolor,
        title: const AppbarText(
          text: 'shop details',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Mymediaquery().mediaqueryheight(0.06, context),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(SlideTransitionPageRoute(child: BodyUpdation()));
            },
            child: const ServiceContainers(
              text: 'Body Maintenance and Repair      ',
            ),
          ),
          SizedBox(
            height: Mymediaquery().mediaqueryheight(0.03, context),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(SlideTransitionPageRoute(child: InteriorUpdation()));
            },
            child: const ServiceContainers(
              text: 'Interior Service and clean              ',
            ),
          ),
          SizedBox(
            height: Mymediaquery().mediaqueryheight(0.03, context),
          ),
          const ServiceContainers(
            text: 'Engine and Mechanichal Services',
          ),
        ],
      ),
    );
  }
}
