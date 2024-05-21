import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/Interior_service_updation/bloc/interior_service_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/body_service_updation/bloc/body_service_updation_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/engine_service_updation/bloc/engine_service_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_texts.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class CustomServiceCard extends StatelessWidget {
  final String texts;
  final VoidCallback onPressed;
  final String eventType;

  const CustomServiceCard({
    super.key,
    required this.texts,
    required this.onPressed,
    required this.eventType,
  });

  @override
  Widget build(BuildContext context) {
    Widget iconButton;
    switch (eventType) {
      case 'interior':
        iconButton = BlocBuilder<InteriorServiceUpdationBloc,
            InteriorServiceUpdationState>(
          builder: (context, state) {
            // Customize the iconButton based on InteriorBloc state
            return IconButton(
              icon: state.servicesFromFirebase.isNotEmpty
                  ? Icon(
                      Icons.check_box,
                      color: Appallcolor().appbarbackgroundcolor,
                      size: Mymediaquery().mediaquerywidth(0.05, context),
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      color: Appallcolor().appbarbackgroundcolor,
                    ),
              onPressed: onPressed,
            );
          },
        );
        break;
      case 'body':
        iconButton =
            BlocBuilder<BodyServiceUpdationBloc, BodyServiceUpdationState>(
          builder: (context, state) {
            // Customize the iconButton based on BodyBloc state
            return IconButton(
              icon: state.servicesFromFirebase.isNotEmpty
                  ? Icon(
                      Icons.check_box,
                      color: Appallcolor().appbarbackgroundcolor,
                      size: Mymediaquery().mediaquerywidth(0.05, context),
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      color: Appallcolor().appbarbackgroundcolor,
                    ),
              onPressed: onPressed,
            );
          },
        );
        break;
      case 'engine':
        iconButton =
            BlocBuilder<EngineServiceUpdationBloc, EngineServiceUpdationState>(
          builder: (context, state) {
            // Customize the iconButton based on EngineBloc state
            return IconButton(
              icon: state.servicesFromFirebase.isNotEmpty
                  ? Icon(
                      Icons.check_box,
                      color: Appallcolor().appbarbackgroundcolor,
                      size: Mymediaquery().mediaquerywidth(0.05, context),
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      color: Appallcolor().appbarbackgroundcolor,
                    ),
              onPressed: onPressed,
            );
          },
        );
        break;
      default:
        // If eventType doesn't match any case, fallback to default icon button
        iconButton = IconButton(
          icon: Icon(
            Icons.check_box_outline_blank,
            color: Appallcolor().appbarbackgroundcolor,
          ),
          onPressed: onPressed,
        );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Mymediaquery().mediaquerywidth(0.03, context),
      ),
      child: Card(
        color: Appallcolor().textcolor,
        child: SizedBox(
          height: Mymediaquery().mediaqueryheight(0.06, context),
          child: Padding(
            padding: EdgeInsets.only(
              left: Mymediaquery().mediaquerywidth(0.02, context),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: Mymediaquery().mediaquerywidth(0.55, context),
                  child: CustomText(
                    width: FontWeight.w300,
                    color: Appallcolor().colorblack,
                    fontSize: Mymediaquery().mediaqueryheight(0.02, context),
                    text: texts,
                  ),
                ),
                iconButton,
                SizedBox(width: Mymediaquery().mediaquerywidth(0.03, context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
