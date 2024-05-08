import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/user_profile_bloc/bloc/user_profile_bloc.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';

profileInitialDataTransfer(BuildContext context) {
  updateUserNameController.text =
      BlocProvider.of<UserProfileBloc>(context).state.userName;
  updateEmailController.text =
      BlocProvider.of<UserProfileBloc>(context).state.email;
  updatePasswordController.text =
      BlocProvider.of<UserProfileBloc>(context).state.password;
  updatePhoneController.text =
      BlocProvider.of<UserProfileBloc>(context).state.whatsapp;
}
