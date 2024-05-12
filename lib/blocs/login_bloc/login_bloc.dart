import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/data/services/firebase_auth/login_verification.dart';
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
    if (event.formkey.currentState!.validate()) {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity.contains(ConnectivityResult.none)) {
        emit(Networkerror(error: 'Check your network connection'));
        return;
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
