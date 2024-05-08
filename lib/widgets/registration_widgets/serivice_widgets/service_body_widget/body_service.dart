import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/body_service/service_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/add_more_dialogue.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/floating_action_button.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_body_widget/body_dynamic.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_container_text.dart';

class BodyServicePage extends StatefulWidget {
  const BodyServicePage({super.key});

  @override
  BodyServicePageState createState() => BodyServicePageState();
}

TextEditingController dentrepairingController = TextEditingController();
TextEditingController scratchController = TextEditingController();
TextEditingController paintController = TextEditingController();
TextEditingController trimController = TextEditingController();

class BodyServicePageState extends State<BodyServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appallcolor().appbackgroundcolor,
        body: Padding(
          padding: EdgeInsets.only(
              top: Mymediaquery().mediaqueryheight(0.02, context)),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<BodyBloc, ServiceState>(
                    builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.serviceNamemap.length + 2,
                    itemBuilder: (context, index) {
                      if (index < state.serviceNamemap.length) {
                        List<dynamic> values =
                            state.serviceNamemap.values.toList();
                        List<String> keys = state.serviceNamemap.keys.toList();
                        return CustomBodydynamicard(
                          texts: keys[index],
                          rate: values[index],
                        );
                      } else if (index == state.serviceNamemap.length) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: Mymediaquery().mediaquerywidth(0.30, context),
                            top: Mymediaquery().mediaqueryheight(0.02, context),
                          ),
                          child: AnimatedButton(
                            selectedBackgroundColor:
                                Appallcolor().buttonforgroundcolor,
                            backgroundColor: Appallcolor().colorblack,
                            borderWidth: 3,
                            borderColor: Appallcolor().textcolor,
                            animationDuration: const Duration(seconds: 1),
                            onPress: () {
                              showAddMoreDialog(
                                  context, context.read<BodyBloc>(), 'body');
                            },
                            width: Mymediaquery().mediaquerywidth(0.4, context),
                            text: 'Add one',
                            selectedTextColor: Colors.black,
                            transitionType: TransitionType.RIGHT_TOP_ROUNDER,
                            textStyle: TextStyle(
                              fontSize:
                                  Mymediaquery().mediaquerywidth(0.04, context),
                              letterSpacing: 1,
                              color: Appallcolor().textcolor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } else {
                        return buildMaintenanceDescription(context);
                      }
                    },
                  );
                }),
              ),
            ],
          ),
        ),
        floatingActionButton: const CustomFloatingActionButton());
  }
}
