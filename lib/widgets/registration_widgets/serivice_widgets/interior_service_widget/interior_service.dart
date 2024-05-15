import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/interior_service/bloc/interior_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/interior_service_widget/dropdownInterior.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_body_widget/body_button.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_body_widget/body_dynamic.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_description_and_texts.dart';

class InteriorServicePage extends StatefulWidget {
  const InteriorServicePage({super.key});

  @override
  BodyServicePageState createState() => BodyServicePageState();
}

class BodyServicePageState extends State<InteriorServicePage> {
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
              child: BlocBuilder<InteriorBloc, InteriorState>(
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
                        onPressed: showDropdownForInterior,
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
    );
  }
}
