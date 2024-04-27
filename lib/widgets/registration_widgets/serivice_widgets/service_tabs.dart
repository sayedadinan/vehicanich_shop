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
// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
// import 'package:vehicanich_shop/utils/app_colors.dart';
// import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/body_service.dart';
// import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/interior_service.dart';

// class ServiceTabPage extends StatelessWidget {
//   const ServiceTabPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _controller = ValueNotifier('all'); // Create controller

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Appallcolor().appbarbackgroundcolor,
//         title: const Text('Add your services'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 60,
//             width: double.infinity,
//             child: AdvancedSegment(
//               controller: _controller,
//               segments: {
//                 'all': 'All',
//                 'primary': 'Primary',
//                 'secondary': 'Secondary',
//               },
//               activeStyle: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//               ),
//               inactiveStyle: TextStyle(
//                 color: Appallcolor().textcolor,
//               ),
//               backgroundColor: Appallcolor().appbarbackgroundcolor,
//               sliderColor: Appallcolor().textcolor,
//               // sliderOffset: 2.0,
//               // borderRadius: const BorderRadius.all(Radius.circular(8.0)),
//               // itemPadding: const EdgeInsets.symmetric(
//               //   horizontal: 15,
//               //   vertical: 10,
//               // ),
//               animationDuration: const Duration(milliseconds: 250),
//               shadow: [
//                 BoxShadow(
//                   color: Appallcolor().appbarbackgroundcolor,
//                   // blurRadius: 8.0,
//                 ),
//               ],
//             ),
//           ),
//           // const SizedBox(height: 8), // Space after AdvancedSegment
//           Expanded(
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return _buildContent(_controller.value);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildContent(String segment) {
//     switch (segment) {
//       case 'all':
//         return const Text('All services');
//       case 'primary':
//         return BodyServicePage();
//       case 'secondary':
//         return InteriorServiceScreen();
//       default:
//         return const Text('Invalid segment');
//     }
//   }
// }
