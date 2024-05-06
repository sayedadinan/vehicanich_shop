// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/data/repositories/shop_details_firebase_service.dart';
import 'package:vehicanich_shop/data/repositories/shop_id_service.dart';
import 'package:vehicanich_shop/services/firebase_auth/phoneauth_.dart';
import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';
import 'package:vehicanich_shop/screens/register_screen/registration_velidations.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial(buttonpressed: false)) {
    on<Registerbuttonpressed>(registrationbuttonpressed);
  }
  void registrationbuttonpressed(
      Registerbuttonpressed event, Emitter<RegistrationState> emit) async {
    emit(Registrationloading(buttonpressed: state.buttonpressed));
    try {
      print('worked this also');
      emit(RegistrationInitial(buttonpressed: true));
      print('threaded');
      if (event.formkey.currentState != null &&
          event.formkey.currentState!.validate() &&
          locationvalidation(event.context) &&
          startingtimevalidation(event.context) &&
          closingtimevalidation(event.context) &&
          bannerphotovalidation(event.context) &&
          licenceimagevalidation(event.context)) {
        await FireBasePhoneAuth().phoneAuthentication(event.context);
        await ShopDetailsFirebaseService()
            .addShopDetailsToFirebase(event.context);
        print('this one');
        emit(Registrationsuccess(buttonpressed: state.buttonpressed));
        print('success fully worked');
        SharedPreferencesService()
            .saveShopPhoneToSharedPreferences(phonecontroller.text);
        FirebaseDatastoring().shopidstoring();
      } else {
        return;
      }
    } catch (e) {
      print('this is the error$e');
    }
  }
}
