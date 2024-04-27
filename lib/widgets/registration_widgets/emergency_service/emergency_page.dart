import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/emergency_bloc/bloc/emergency_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_description_and_texts.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/static_card.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100), // Adjust the height as needed
        child: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 39),
            child: Text(
              'Add your Emergency',
              style: TextStyle(
                color: Appallcolor().colorwhite,
              ),
            ),
          ),
          backgroundColor: Appallcolor().appbarbackgroundcolor,
        ),
      ),
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: BlocBuilder<EmergencyBloc, EmergencyState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.serviceNameList.length + 2,
              itemBuilder: (context, index) {
                if (index < state.serviceNameList.length) {
                  return CustomEmergencyStaticCard(
                      texts: state.serviceNameList[index]);
                } else if (index == state.serviceNameList.length) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 108,
                      top: 10,
                    ),
                    child: AnimatedButton(
                      selectedBackgroundColor:
                          Appallcolor().emergencybuttoncolor,
                      backgroundColor: Appallcolor().colorblack,
                      borderWidth: 3,
                      borderColor: Appallcolor().textcolor,
                      animationDuration: const Duration(seconds: 1),
                      onPress: () {
                        _showAddMoreBottomSheet(context);
                      },
                      width: 200,
                      text: 'Add more',
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.RIGHT_TOP_ROUNDER,
                      textStyle: TextStyle(
                        fontSize: 28,
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
          },
        ),
      ),
    );
  }
}

void _showAddMoreBottomSheet(BuildContext context) {
  TextEditingController firstTextFieldController = TextEditingController();
  showModalBottomSheet(
    elevation: 20,
    backgroundColor: Appallcolor().textcolor,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Inputfield(
              controller: firstTextFieldController,
              hinttext: 'add your services',
              keyboardType: TextInputType.name,
              label: 'service',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String firstText = firstTextFieldController.text;
                // if (firstText.isNotEmpty) {
                context.read<EmergencyBloc>().add(
                    EmergencyServiceAddingButtonPressed(
                        newservicename: firstText));
                Navigator.pop(context); // Close bottom sheet
                // } else {}
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      );
    },
  );
}
