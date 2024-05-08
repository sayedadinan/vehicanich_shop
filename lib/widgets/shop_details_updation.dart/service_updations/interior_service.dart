import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/Interior_service_updation/bloc/interior_service_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/floating_action_button.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/custom_animation_button.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/service_card.dart';

class InteriorUpdation extends StatefulWidget {
  const InteriorUpdation({Key? key}) : super(key: key);

  @override
  InteriorUpdationState createState() => InteriorUpdationState();
}

class InteriorUpdationState extends State<InteriorUpdation> {
  @override
  void initState() {
    super.initState();
    context
        .read<InteriorServiceUpdationBloc>()
        .add(FetchDatatoInteriorServicePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appallcolor().appbarbackgroundcolor,
      ),
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: Padding(
        padding: EdgeInsets.only(
          top: Mymediaquery().mediaqueryheight(0.02, context),
        ),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<InteriorServiceUpdationBloc,
                  InteriorServiceUpdationState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.servicesFromFirebase.length + 1,
                    itemBuilder: (context, index) {
                      if (index < state.servicesFromFirebase.length) {
                        List<dynamic> values =
                            state.servicesFromFirebase.values.toList();
                        List<String> keys =
                            state.servicesFromFirebase.keys.toList();
                        return CustomServiceCard(
                          eventType: 'interior',
                          onPressed: () {
                            context.read<InteriorServiceUpdationBloc>().add(
                                InteriorEnableButtonPressedUpdation(
                                    serviceName: keys[index],
                                    serviceRate: values[index]));
                          },
                          texts: keys[index],
                          rate: values[index],
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: Mymediaquery().mediaquerywidth(0.30, context),
                            top: Mymediaquery().mediaqueryheight(0.02, context),
                          ),
                          child: CustomAnimatedButton(
                            bloc: context.read<InteriorServiceUpdationBloc>(),
                            buttonText: 'Add more',
                            eventType: 'interior',
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
