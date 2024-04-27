import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/body_service/service_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_texts.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_textfield.dart';

class Bodydentreparingcard extends StatelessWidget {
  final String texts;
  final TextEditingController controller;
  const Bodydentreparingcard(
      {super.key, required this.texts, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Mymediaquery().mediaqueryheight(0.01, context),
          right: Mymediaquery().mediaquerywidth(0.01, context)),
      child: Card(
        color: Appallcolor().textcolor,
        child: SizedBox(
          height: Mymediaquery().mediaqueryheight(0.06, context),
          child: Padding(
            padding: EdgeInsets.only(
                left: Mymediaquery().mediaquerywidth(0.02, context)),
            child: Row(
              children: [
                SizedBox(
                  width: Mymediaquery().mediaquerywidth(0.24, context),
                  child: CustomText(
                    width: FontWeight.w300,
                    color: Appallcolor().colorblack,
                    fontSize: Mymediaquery().mediaqueryheight(0.02, context),
                    text: texts,
                  ),
                ),
                IconButton(
                  icon: BlocProvider.of<BodyBloc>(context, listen: true)
                          .state
                          .newmpty
                          .contains(texts)
                      ? Icon(
                          Icons.check_box,
                          color: Appallcolor().appbarbackgroundcolor,
                          size: Mymediaquery().mediaquerywidth(0.03, context),
                        )
                      : Icon(
                          Icons.check_box_outline_blank,
                          color: Appallcolor().appbarbackgroundcolor,
                        ),
                  onPressed: () {
                    context.read<BodyBloc>().add(BodyEnableButtonPressed(
                        serviceName: texts, rate: controller));
                  },
                ),
                SizedBox(width: Mymediaquery().mediaquerywidth(0.00, context)),
                CustomServiceTextField(
                  controller: controller,
                  enabled: BlocProvider.of<BodyBloc>(context)
                      .state
                      .newmpty
                      .contains(texts),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
