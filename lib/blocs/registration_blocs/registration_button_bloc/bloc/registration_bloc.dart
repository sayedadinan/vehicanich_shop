// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';
import 'package:vehicanich_shop/data/repositories/shop_details_firebase_service.dart';
import 'package:vehicanich_shop/data/repositories/shop_id_service.dart';
import 'package:vehicanich_shop/data/services/firebase_auth/phoneauth_.dart';
import 'package:vehicanich_shop/screens/register_screen/registration_velidations.dart';
import 'package:vehicanich_shop/utils/bottom_navigation/bottom_list.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial(buttonpressed: false)) {
    on<Registerbuttonpressed>(registrationbuttonpressed);
    on<OtpValidation>(otpValidation);
    on<SubmitOtpButtonPressed>(submitOtppressed);
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
          licenceimagevalidation(event.context) &&
          interiorvalidation(event.context)) {
        emit(Registrationloading(buttonpressed: state.buttonpressed));
        add(SubmitOtpButtonPressed(context: event.context));
        // add(OtpValidation(context: event.context));
        // await FireBasePhoneAuth().phoneAuthentication(event.context);

        // print('this one');
        // emit(Registrationsuccess(buttonpressed: state.buttonpressed));
        print('success fully worked otp validation');
      } else {
        return;
      }
    } catch (e) {
      print('this is the error$e');
    }
  }

  otpValidation(OtpValidation event, Emitter<RegistrationState> emit) async {
    try {
      await FireBasePhoneAuth().phoneAuthentication(event.context);
    } catch (e) {
      emit(PhoneNumberAlreadyRegistered(buttonpressed: state.buttonpressed));
    }
  }

  submitOtppressed(
      SubmitOtpButtonPressed event, Emitter<RegistrationState> emit) async {
    // if (event.otpkey.currentState!.validate()) {
    // emit(OtpScreenLoading(buttonpressed: state.buttonpressed));
    emit(Registrationloading(buttonpressed: state.buttonpressed));
    try {
      final QuerySnapshot shopDetailsCollection = await ShopreferenceId()
          .shopCollectionReference()
          .where("phone", isEqualTo: phonecontroller.text)
          .get();
      if (shopDetailsCollection.docs.isEmpty) {
        await ShopDetailsFirebaseService()
            .addShopDetailsToFirebase(event.context);
        // await FireBasePhoneAuth()
        //     .verifyingAndAddingToFireBase(event.verificationId, event.context);
        SharedPreferencesService()
            .saveShopPhoneToSharedPreferences(phonecontroller.text);
        FirebaseDatastoring().shopidstoring();
        Navigator.of(event.context)
            .push(MaterialPageRoute(builder: (context) => BottomBar()));
      } else {
        emit(PhoneNumberAlreadyRegistered(buttonpressed: state.buttonpressed));
        // Navigator.of(event.context).pop();
        // final snackBar = SnackBar(
        //   padding: const EdgeInsets.all(26),
        //   elevation: 0,
        //   behavior: SnackBarBehavior.floating,
        //   backgroundColor: Colors.transparent,
        //   content: AwesomeSnackbarContent(
        //     title: 'Error',
        //     message: 'this phone already registered',
        //     contentType: ContentType.failure,
        //   ),
        // );
        // ScaffoldMessenger.of(event.context)
        //   ..hideCurrentSnackBar()
        //   ..showSnackBar(snackBar);
        // Navigator.of(event.context).pop();
      }
    } catch (e) {
      emit(RegistrationError(buttonpressed: state.buttonpressed));
    }
    // } else {
    //   log('some problem');
    // }
  }
}
