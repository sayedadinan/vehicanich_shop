import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/body_service/service_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_texts.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_tabs.dart';

class BodyServiceContainer extends StatelessWidget {
  final String text;
  const BodyServiceContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BodyBloc, ServiceState>(
      listener: (context, state) {
        if (state is NavigatetoBodyservice) {
          Navigator.of(context)
              .push(FadeTransitionPageRoute(child: const ServiceTabPage()));
        }
      },
      child: GestureDetector(
        onTap: () {
          context.read<BodyBloc>().add(BodymaintaincePressed());
        },
        child: Padding(
          padding: EdgeInsets.only(
              left: Mymediaquery().mediaquerywidth(0.02, context),
              right: Mymediaquery().mediaquerywidth(0.02, context)),
          child: Container(
            width: double.infinity,
            height: Mymediaquery().mediaqueryheight(0.07, context),
            decoration: BoxDecoration(
              color: Appallcolor().placeholderimagecolor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: Mymediaquery().mediaquerywidth(0.02, context),
                ),
                CustomText(
                    text: text,
                    fontSize: Mymediaquery().mediaquerywidth(0.02, context),
                    color: Appallcolor().colorblack,
                    width: FontWeight.w500),
                SizedBox(
                  width: Mymediaquery().mediaquerywidth(0.17, context),
                ),
                Icon(
                  Icons.arrow_right,
                  size: Mymediaquery().mediaquerywidth(0.04, context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
