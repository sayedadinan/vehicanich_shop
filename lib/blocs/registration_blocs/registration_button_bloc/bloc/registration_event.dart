part of 'registration_bloc.dart';

sealed class RegistrationEvent {}

class Registerbuttonpressed extends RegistrationEvent {
  final BuildContext context;
  final GlobalKey<FormState> formkey;
  Registerbuttonpressed(this.formkey, {required this.context});
}

final class OtpValidation extends RegistrationEvent {
  final BuildContext context;

  OtpValidation({required this.context});
}

class SubmitOtpButtonPressed extends RegistrationEvent {
  final BuildContext context;
  // final GlobalKey<FormState> otpkey;
  // final String verificationId;
  SubmitOtpButtonPressed({
    required this.context,
    // required this.otpkey,
    // required this.verificationId,
  });
}
