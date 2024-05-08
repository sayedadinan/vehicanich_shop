import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/body_service_updation/bloc/body_service_updation_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/floating_action_button.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/custom_animation_button.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/service_card.dart';

class BodyUpdation extends StatefulWidget {
  const BodyUpdation({Key? key}) : super(key: key);

  @override
  BodyUpdationState createState() => BodyUpdationState();
}

class BodyUpdationState extends State<BodyUpdation> {
  @override
  void initState() {
    super.initState();
    context.read<BodyServiceUpdationBloc>().add(FetchDatatoBodyServicePage());
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
              child: BlocBuilder<BodyServiceUpdationBloc,
                  BodyServiceUpdationState>(
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
                          eventType: 'body',
                          onPressed: () {
                            context.read<BodyServiceUpdationBloc>().add(
                                BodyEnableButtonPressedUpdation(
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
                            bloc: context.read<BodyServiceUpdationBloc>(),
                            buttonText: 'Add more',
                            eventType: 'body updation',
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
