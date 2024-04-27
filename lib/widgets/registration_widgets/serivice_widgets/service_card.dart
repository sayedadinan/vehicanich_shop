// import 'package:flutter/material.dart';
// import 'package:vehicanich_shop/utils/app_colors.dart';
// import 'package:vehicanich_shop/utils/app_texts.dart';
// import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_rate.dart';

// class ServiceCard extends StatelessWidget {
//   const ServiceCard({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     // You can return any widget here based on your requirement.
//     return Card(
//       elevation: 20,
//       color: Appallcolor().textcolor,
//       child: Container(
//         height: 60,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20),
//           child: Row(
//             children: [
//               CustomText(
//                 width: FontWeight.w300,
//                 color: Appallcolor().colorblack,
//                 fontSize: 25,
//                 text: 'Your default text here',
//               ),
//               const SizedBox(width: 90),
//               IconButton(
//                 icon: Icon(
//                   Icons.check_box_outline_blank,
//                   color: Appallcolor().appbarbackgroundcolor,
//                 ),
//                 onPressed: () {
//                   // Add your onPressed logic here
//                 },
//               ),
//               const SizedBox(width: 30),
//               CustomServiceTextField(
//                   enabled: true), // You may want to adjust this
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
