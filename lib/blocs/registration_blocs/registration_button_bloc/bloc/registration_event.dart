part of 'registration_bloc.dart';

sealed class RegistrationEvent {}

class Registerbuttonpressed extends RegistrationEvent {
  final BuildContext context;
  final GlobalKey<FormState> formkey;
  Registerbuttonpressed(this.formkey, {required this.context});
}
