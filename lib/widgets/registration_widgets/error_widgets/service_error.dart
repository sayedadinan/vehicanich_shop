import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/registration_button_bloc/bloc/registration_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/body_service/service_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/engine_bloc/bloc/engine_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/interior_service/bloc/interior_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';

class ServiceErrorText extends StatelessWidget {
  const ServiceErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (BlocProvider.of<BodyBloc>(context, listen: true)
                .state
                .servicesList
                .isEmpty &&
            BlocProvider.of<InteriorBloc>(context, listen: true)
                .state
                .servicesList
                .isEmpty &&
            BlocProvider.of<EngineBloc>(context, listen: true)
                .state
                .servicesList
                .isEmpty &&
            BlocProvider.of<RegistrationBloc>(context, listen: true)
                .state
                .buttonpressed)
          Container(
            padding: const EdgeInsets.only(left: 30, top: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Please select any one of service',
              style: TextStyle(
                color: Appallcolor().emergencybuttoncolor,
                fontSize: 16,
              ),
            ),
          ),
      ],
    );
  }
}
