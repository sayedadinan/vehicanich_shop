part of 'login_bloc.dart';

sealed class LoginBlocState {}

class InitialBlocState extends LoginBlocState {}

class NavigateToForgetPage extends LoginBlocState {}

class LoginSuccess extends LoginBlocState {}

class NavigateToGoogleLogin extends LoginBlocState {}

class NavigateToRegisterNow extends LoginBlocState {}

class NavigateToOtpPage extends LoginBlocState {}

class NavigateToNewpassword extends LoginBlocState {}

class Networkerror extends LoginBlocState {
  final String error;

  Networkerror({required this.error});
}

class LoginLoading extends LoginBlocState {}

class LoginError extends LoginBlocState {
  final String error;

  LoginError({required this.error});
}
