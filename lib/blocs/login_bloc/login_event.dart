part of 'login_bloc.dart';

class LoginBlocEvent {}

class ForgotButtonPressed extends LoginBlocEvent {}

class LoginScreenButtonPressed extends LoginBlocEvent {
  final GlobalKey<FormState> formkey;
  final BuildContext context;
  LoginScreenButtonPressed({required this.formkey, required this.context});
}

class LoginWithGoogleButtonPressed extends LoginBlocEvent {}

class RegistorNowButtonPressed extends LoginBlocEvent {}

class SendcodeButtonPressed extends LoginBlocEvent {}

class VerifyButtonPressed extends LoginBlocEvent {}
