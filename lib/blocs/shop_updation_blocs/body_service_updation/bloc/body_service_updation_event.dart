part of 'body_service_updation_bloc.dart';

sealed class BodyServiceUpdationEvent {}

class FetchDatatoBodyServicePage extends BodyServiceUpdationEvent {}

class BodyServiceUpdationAddingPressed extends BodyServiceUpdationEvent {
  final String serviceName;
  final dynamic serviceRate;

  BodyServiceUpdationAddingPressed(
      {required this.serviceName, required this.serviceRate});
}

class BodyServiceUpdationSavePressed extends BodyServiceUpdationEvent {}

class BodyEnableButtonPressedUpdation extends BodyServiceUpdationEvent {
  final String serviceName;
  final dynamic serviceRate;

  BodyEnableButtonPressedUpdation(
      {required this.serviceName, required this.serviceRate});
}
