import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/body_service/service_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_body_widget/body_button.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_body_widget/body_dynamic.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_body_widget/dropdown.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_container_text.dart';

class BodyServicePage extends StatefulWidget {
  const BodyServicePage({super.key});
  @override
  BodyServicePageState createState() => BodyServicePageState();
}

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
                  itemCount: state.servicesList.length + 2,
                  itemBuilder: (context, index) {
                    if (index < state.servicesList.length) {
                      return CustomBodydynamicard(
                        texts: state.servicesList[index].toString(),
                      );
                    } else if (index == state.servicesList.length) {
                      return const ServiceAreaButton(
                        onPressed: showDropdown,
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
