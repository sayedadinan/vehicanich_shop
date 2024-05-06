import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/engine_service_widgets/engine_service.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/interior_service_widget/interior_service.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_body_widget/body_service.dart';

class ServiceTabPage extends StatelessWidget {
  const ServiceTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appallcolor().appbarbackgroundcolor,
          title: const Text(
            'Add your services',
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Body services'),
              Tab(text: 'Interior services'),
              Tab(text: 'Engine Services')
            ],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Appallcolor().textcolor,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Appallcolor().appbarbackgroundcolor,
            indicatorColor: Appallcolor().buttonforgroundcolor,
            unselectedLabelColor: Appallcolor().colorwhite,
          ),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            BodyServicePage(),
            InteriorServicePage(),
            EngineServicePage()
          ],
        ),
      ),
    );
  }
}
