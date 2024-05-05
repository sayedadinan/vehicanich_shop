part of 'registration_bloc.dart';

sealed class RegistrationState {
  final bool buttonpressed;

  RegistrationState({required this.buttonpressed});
}

final class RegistrationInitial extends RegistrationState {
  RegistrationInitial({required super.buttonpressed});
}

class Registrationsuccess extends RegistrationState {
  Registrationsuccess({required super.buttonpressed});
}

class Registrationloading extends RegistrationState {
  Registrationloading({required super.buttonpressed});
}
