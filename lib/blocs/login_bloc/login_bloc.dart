import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
import 'package:vehicanich_shop/data/repositories/shop_id_service.dart';
import 'package:vehicanich_shop/data/services/firebase_auth/login_verification.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(InitialBlocState()) {
    on<ForgotButtonPressed>(forgotButtonPressed);
    on<SendcodeButtonPressed>(sendcodeButtonPressed);
    on<VerifyButtonPressed>(verifyButtonPressed);
    on<LoginScreenButtonPressed>(loginScreenButtonPressed);
  }
  forgotButtonPressed(ForgotButtonPressed event, Emitter<LoginBlocState> emit) {
    emit(NavigateToForgetPage());
  }

  sendcodeButtonPressed(
      SendcodeButtonPressed event, Emitter<LoginBlocState> emit) {
    emit(NavigateToOtpPage());
  }

  verifyButtonPressed(VerifyButtonPressed event, Emitter<LoginBlocState> emit) {
    emit(NavigateToNewpassword());
  }

  loginScreenButtonPressed(
      LoginScreenButtonPressed event, Emitter<LoginBlocState> emit) async {
    emit(LoginLoading());
    if (event.formkey.currentState!.validate()) {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
        final snackBar = SnackBar(
          padding: const EdgeInsets.all(26),
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
              title: 'Oops',
              message: 'check your connection',
              contentType: ContentType.failure),
        );
        ScaffoldMessenger.of(event.context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        emit(Networkerror(error: 'Check your network connection'));
        return;
      }
      final QuerySnapshot shopDetailsCollection = await ShopreferenceId()
          .shopCollectionReference()
          .where("phone", isEqualTo: loginphonecontroller.text)
          .get();
      if (shopDetailsCollection.docs.isEmpty) {
        final snackBar = SnackBar(
          padding: const EdgeInsets.all(26),
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
              title: 'Oops',
              message: 'some thing went wrong',
              contentType: ContentType.failure),
        );
        ScaffoldMessenger.of(event.context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        emit(LoginError(error: 'some thing went wrong'));
        // return;
      } else {
        final data = shopDetailsCollection.docs.first;
        final password = data['password'];
        if (password == loginpasswordcontroller.text) {
          await SharedPreferencesService()
              .saveShopPhoneToSharedPreferences(loginphonecontroller.text);
          log('successfully login');
          loginphonecontroller.clear();
          loginpasswordcontroller.clear();
          emit(LoginSuccess());
          final snackBar = SnackBar(
            padding: const EdgeInsets.all(26),
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
                title: 'Ohh',
                message: 'Ohh you successfully login to Vehicanich',
                contentType: ContentType.success),
          );
          ScaffoldMessenger.of(event.context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        } else {
          emit(LoginError(error: 'some thing went wrong'));
          final snackBar = SnackBar(
            padding: const EdgeInsets.all(26),
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
                title: 'Oops',
                message: 'some thing went wrong',
                contentType: ContentType.failure),
          );
          ScaffoldMessenger.of(event.context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      }
      emit(LoginLoading());
      final loginverification = LoginVerification();
      final result = await loginverification.verifyLoginDetails();
      if (result == 'Login successful') {
        emit(LoginSuccess());
      } else if (result == 'User does not exist') {
        emit(LoginError(error: 'User does not exist'));
      } else if (result == 'Password is incorrect') {
        emit(LoginError(error: 'Password is incorrect'));
      } else {
        emit(LoginError(error: 'some thing went wrong'));
      }
    }
  }
}
