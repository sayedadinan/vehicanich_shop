import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/registration_button_bloc/bloc/registration_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/startingtime_bloc.dart/bloc/time_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';

class StartingtimeErrorText extends StatelessWidget {
  const StartingtimeErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartingTimeBloc, TimeState>(
      builder: (context, state) {
        if (state.startingTime.isEmpty &&
            BlocProvider.of<RegistrationBloc>(context, listen: true)
                .state
                .buttonpressed) {
          return Container(
            padding: const EdgeInsets.only(left: 30, top: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Please choose a time',
              style: TextStyle(
                color: Appallcolor().emergencybuttoncolor,
                fontSize: 16,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
