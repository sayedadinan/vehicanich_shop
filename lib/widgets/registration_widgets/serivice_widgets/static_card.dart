import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/emergency_bloc/bloc/emergency_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_texts.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_textfield.dart';

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
