import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/engine_bloc/bloc/engine_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/engine_service_widgets/engine_dropdown.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_body_widget/body_button.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_body_widget/body_dynamic.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_container_text.dart';

class EngineServicePage extends StatefulWidget {
  const EngineServicePage({super.key});

  @override
  BodyServicePageState createState() => BodyServicePageState();
}

class BodyServicePageState extends State<EngineServicePage> {
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
              child: BlocBuilder<EngineBloc, EngineState>(
                  builder: (context, state) {
                return ListView.builder(
                  itemCount: state.servicesList.length + 2,
                  itemBuilder: (context, index) {
                    if (index < state.servicesList.length) {
                      return CustomBodydynamicard(
                        texts: state.servicesList[index],
                      );
                    } else if (index == state.servicesList.length) {
                      return const ServiceAreaButton(
                        onPressed: showDropdownForEngine,
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
    );
  }
}
