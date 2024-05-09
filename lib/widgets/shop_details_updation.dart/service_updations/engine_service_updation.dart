import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/engine_service_updation/bloc/engine_service_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/custom_animation_button.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/custom_floating.dart';
import 'package:vehicanich_shop/widgets/shop_details_updation.dart/service_card.dart';

class EngineUpdation extends StatefulWidget {
  const EngineUpdation({Key? key}) : super(key: key);

  @override
  EngineUpdationState createState() => EngineUpdationState();
}

class EngineUpdationState extends State<EngineUpdation> {
  @override
  void initState() {
    super.initState();
    context
        .read<EngineServiceUpdationBloc>()
        .add(FetchDatatoEngineServicePage());
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
              child: BlocBuilder<EngineServiceUpdationBloc,
                  EngineServiceUpdationState>(
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
                          eventType: 'engine',
                          onPressed: () {
                            context.read<EngineServiceUpdationBloc>().add(
                                EngineEnableButtonPressedUpdation(
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
                            bloc: context.read<EngineServiceUpdationBloc>(),
                            buttonText: 'Add more',
                            eventType: 'engine',
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
      floatingActionButton:
          const CustomFloatingActionButtonForUpdationForEngine(),
    );
  }
}
