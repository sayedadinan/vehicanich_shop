part of 'login_bloc.dart';

class LoginBlocEvent {}

class ForgotButtonPressed extends LoginBlocEvent {}

class LoginScreenButtonPressed extends LoginBlocEvent {
  final GlobalKey<FormState> formkey;

  LoginScreenButtonPressed({required this.formkey});
}

class LoginWithGoogleButtonPressed extends LoginBlocEvent {}

class RegistorNowButtonPressed extends LoginBlocEvent {}

class SendcodeButtonPressed extends LoginBlocEvent {}

class VerifyButtonPressed extends LoginBlocEvent {}
