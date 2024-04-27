import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/firebase_auth/phoneauth_.dart';
import 'package:vehicanich_shop/repositories/shop_data_repositery.dart';
import 'package:vehicanich_shop/screens/register_screen/registration_velidations.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial(buttonpressed: false)) {
    on<Registerbuttonpressed>(registrationbuttonpressed);
  }
  void registrationbuttonpressed(
      Registerbuttonpressed event, Emitter<RegistrationState> emit) async {
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
        await FirebaseDatastoring().addShopDetailsToFirebase(event.context);
        print('this one');
        emit(Registrationsuccess(buttonpressed: state.buttonpressed));
        print('success fully worked');
      } else {
        return;
      }
    } catch (e) {
      print('this is the error$e');
    }
  }
}
