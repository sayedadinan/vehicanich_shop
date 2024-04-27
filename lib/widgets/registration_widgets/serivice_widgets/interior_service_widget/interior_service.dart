import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/interior_service/bloc/interior_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';
import 'package:vehicanich_shop/utils/app_validators.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_body_widget/body_dynamic.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_description_and_texts.dart';

class InteriorServicePage extends StatefulWidget {
  const InteriorServicePage({super.key});

  @override
  BodyServicePageState createState() => BodyServicePageState();
}

TextEditingController dentrepairingController = TextEditingController();
TextEditingController scratchController = TextEditingController();
TextEditingController paintController = TextEditingController();
TextEditingController trimController = TextEditingController();

class BodyServicePageState extends State<InteriorServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: Padding(
        padding:
            EdgeInsets.only(top: Mymediaquery().mediaquerywidth(0.02, context)),
        child: Column(
          children: [
            // Bodydentreparingcard(
            //   controller: dentrepairingController,
            //   texts: 'Dent Repairings',
            // ),
            // Bodydentreparingcard(
            //   controller: scratchController,
            //   texts: 'Scratch Removal',
            // ),
            // Bodydentreparingcard(
            //   controller: paintController,
            //   texts: 'Paint Refinishing',
            // ),
            // Bodydentreparingcard(
            //   controller: trimController,
            //   texts: 'Body trimrepair',
            // ),
            Expanded(
              child: BlocBuilder<InteriorBloc, InteriorState>(
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
                          left: Mymediaquery().mediaquerywidth(0.12, context),
                          top: 10,
                        ),
                        child: AnimatedButton(
                          selectedBackgroundColor:
                              Appallcolor().buttonforgroundcolor,
                          backgroundColor: Appallcolor().colorblack,
                          borderWidth: 3,
                          borderColor: Appallcolor().textcolor,
                          animationDuration: const Duration(seconds: 1),
                          onPress: () {
                            _showAddMoreDialog(context);
                          },
                          width: Mymediaquery().mediaquerywidth(0.2, context),
                          text: 'Add one',
                          selectedTextColor: Colors.black,
                          transitionType: TransitionType.RIGHT_TOP_ROUNDER,
                          textStyle: TextStyle(
                            fontSize:
                                Mymediaquery().mediaquerywidth(0.02, context),
                            letterSpacing: 1,
                            color: Appallcolor().textcolor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(49.0),
                            color: Appallcolor().appbarbackgroundcolor),
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: const Padding(
                          padding: EdgeInsets.all(24.0),
                          child: SizedBox(
                            child: BodyMaintainceDescription(),
                          ),
                        ),
                      );
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            bottom: Mymediaquery().mediaqueryheight(0.02, context),
            right: Mymediaquery().mediaquerywidth(0.03, context)),
        child: SizedBox(
          width: Mymediaquery().mediaquerywidth(0.18, context),
          height: Mymediaquery().mediaqueryheight(0.06, context),
          child: FloatingActionButton(
              onPressed: () {},
              child: BlocProvider.of<InteriorBloc>(context, listen: true)
                      .state
                      .serviceNamemap
                      .isEmpty
                  ? Text(
                      'skip',
                      style: TextStyle(
                          fontSize:
                              Mymediaquery().mediaquerywidth(0.02, context)),
                    )
                  : Text('next',
                      style: TextStyle(
                          fontSize:
                              Mymediaquery().mediaquerywidth(0.02, context)))),
        ),
      ),
    );
  }

  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  TextEditingController serviceNameController = TextEditingController();
  TextEditingController serviceRateController = TextEditingController();
  void _showAddMoreDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation1, animation2) {
        return Material(
          animationDuration: const Duration(seconds: 4),
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Appallcolor().textcolor,
                borderRadius: BorderRadius.circular(13),
              ),
              height: Mymediaquery().mediaqueryheight(0.34, context),
              width: Mymediaquery().mediaqueryheight(0.37, context),
              padding: const EdgeInsets.all(20),
              child: Form(
                key: signupKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.02, context)),
                    Text(
                      'Add all your services',
                      style: TextStyle(
                          fontSize:
                              Mymediaquery().mediaqueryheight(0.02, context)),
                    ),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.03, context)),
                    Inputfield(
                      validator: (value) =>
                          Validators().validateEmpty('service', value),
                      controller: serviceNameController,
                      hinttext: 'Give your services',
                      keyboardType: TextInputType.name,
                      label: 'service',
                    ),
                    const SizedBox(height: 10),
                    Inputfield(
                      validator: (value) =>
                          Validators().validateNumericInput(value),
                      maxlength: 5,
                      controller: serviceRateController,
                      hinttext: 'Give your services',
                      keyboardType: TextInputType.number,
                      label: 'rate',
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (signupKey.currentState!.validate()) {
                              String serviceName = serviceNameController.text;
                              int serviceRate =
                                  int.parse(serviceRateController.text);
                              context.read<InteriorBloc>().add(
                                  InteriorServiceAddingButtonPressed(
                                      newservicename: serviceName,
                                      rate: serviceRate));
                              serviceNameController.clear();
                              serviceRateController.clear();
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Submit'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn,
          ),
          child: child,
        );
      },
    );
  }
}
