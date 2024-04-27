import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/image_blocs/image_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/registration_button_bloc/bloc/registration_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';

class LicenceErrorText extends StatelessWidget {
  const LicenceErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        if (state.licenceimagepath.isEmpty &&
            BlocProvider.of<RegistrationBloc>(context, listen: true)
                .state
                .buttonpressed) {
          return Container(
            padding: const EdgeInsets.only(left: 30, top: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Please give your shop licence photo for validation',
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
