import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/emergency_bloc/bloc/emergency_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_texts.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_textfield.dart';

// class CustomInteriorStaticCard extends StatelessWidget {
//   final String texts;
//   CustomInteriorStaticCard({Key? key, required this.texts}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//           left: Mymediaquery().mediaqueryheight(0.01, context),
//           right: Mymediaquery().mediaquerywidth(0.01, context)),
//       child: Card(
//         color: Appallcolor().textcolor,
//         child: SizedBox(
//           height: Mymediaquery().mediaqueryheight(0.06, context),
//           child: Padding(
//             padding: EdgeInsets.only(
//                 left: Mymediaquery().mediaquerywidth(0.02, context)),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: Mymediaquery().mediaquerywidth(0.24, context),
//                   child: CustomText(
//                     width: FontWeight.w300,
//                     color: Appallcolor().colorblack,
//                     fontSize: Mymediaquery().mediaqueryheight(0.02, context),
//                     text: texts,
//                   ),
//                 ),
//                 IconButton(
//                   icon: BlocProvider.of<InteriorBloc>(context)
//                           .state
//                           .newmpty
//                           .contains(texts)
//                       ? Icon(
//                           Icons.check_box,
//                           color: Appallcolor().appbarbackgroundcolor,
//                           size: Mymediaquery().mediaquerywidth(0.03, context),
//                         )
//                       : Icon(
//                           Icons.check_box_outline_blank,
//                           color: Appallcolor().appbarbackgroundcolor,
//                         ),
//                   onPressed: () {
//                     // context.read<InteriorBloc>().add(
//                     //     InteriorEnableButtonPressed(
//                     //         serviceName: texts, rate: rate));
//                   },
//                 ),
//                 // const SizedBox(width: 20), // Adjust spacing as needed
//                 // CustomServiceTextField(
//                 //   controller: intcontroller,
//                 //   enabled: BlocProvider.of<InteriorBloc>(context)
//                 //       .state
//                 //       .newmpty
//                 //       .contains(texts),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // final TextEditingController bodycontroller = TextEditingController();

// class CustomEngineStaticCard extends StatefulWidget {
//   final String texts;
//   CustomEngineStaticCard({super.key, required this.texts});

//   @override
//   State<CustomEngineStaticCard> createState() => _CustomEngineStaticCard();
// }

// class _CustomEngineStaticCard extends State<CustomEngineStaticCard> {
//   TextEditingController _engineController =
//       TextEditingController(); // Create controller here

//   @override
//   void dispose() {
//     _engineController.dispose(); // Dispose controller when widget is removed
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//           left: Mymediaquery().mediaqueryheight(0.01, context),
//           right: Mymediaquery().mediaquerywidth(0.01, context)),
//       child: Card(
//         color: Appallcolor().textcolor,
//         child: SizedBox(
//           height: Mymediaquery().mediaqueryheight(0.06, context),
//           child: Padding(
//             padding: EdgeInsets.only(
//                 left: Mymediaquery().mediaquerywidth(0.02, context)),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: Mymediaquery().mediaquerywidth(0.24, context),
//                   child: CustomText(
//                     width: FontWeight.w300,
//                     color: Appallcolor().colorblack,
//                     fontSize: Mymediaquery().mediaqueryheight(0.02, context),
//                     text: widget.texts,
//                   ),
//                 ),
//                 IconButton(
//                   icon: BlocProvider.of<EngineBloc>(context)
//                           .state
//                           .newmpty
//                           .contains(widget.texts)
//                       ? Icon(
//                           Icons.check_box,
//                           color: Appallcolor().appbarbackgroundcolor,
//                           size: Mymediaquery().mediaquerywidth(0.03, context),
//                         )
//                       : Icon(
//                           Icons.check_box_outline_blank,
//                           color: Appallcolor().appbarbackgroundcolor,
//                         ),
//                   onPressed: () {
//                     context.read<EngineBloc>().add(
//                         EngineEnableButtonPressed(serviceName: widget.texts));
//                   },
//                 ),
//                 // Adjust spacing as needed
//                 CustomServiceTextField(
//                   controller: _engineController, // Use the local controller
//                   enabled: BlocProvider.of<EngineBloc>(context)
//                       .state
//                       .newmpty
//                       .contains(widget.texts),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomEmergencyStaticCard extends StatefulWidget {
  final String texts;
  const CustomEmergencyStaticCard({super.key, required this.texts});

  @override
  State<CustomEmergencyStaticCard> createState() =>
      _CustomEmergencyStaticCard();
}

final TextEditingController emergencycontroller = TextEditingController();

class _CustomEmergencyStaticCard extends State<CustomEmergencyStaticCard> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Mymediaquery().mediaqueryheight(0.01, context),
          right: Mymediaquery().mediaquerywidth(0.01, context)),
      child: Card(
        color: Appallcolor().textcolor,
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                SizedBox(
                  width: 230,
                  child: CustomText(
                    width: FontWeight.w300,
                    color: Appallcolor().colorblack,
                    fontSize: 25,
                    text: widget.texts,
                  ),
                ),
                IconButton(
                  icon: BlocProvider.of<EmergencyBloc>(context)
                          .state
                          .newmpty
                          .contains(widget.texts)
                      ? Icon(
                          Icons.check_box,
                          color: Appallcolor().emergencybuttoncolor,
                          size: 33,
                        )
                      : Icon(
                          Icons.check_box_outline_blank,
                          color: Appallcolor().appbarbackgroundcolor,
                        ),
                  onPressed: () {
                    context.read<EmergencyBloc>().add(
                        EmergencyEnableButtonPressed(
                            serviceName: widget.texts));
                  },
                ),
                const SizedBox(width: 20), // Adjust spacing as needed
                CustomServiceTextField(
                  controller: emergencycontroller,
                  enabled: BlocProvider.of<EmergencyBloc>(context)
                      .state
                      .newmpty
                      .contains(widget.texts),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
