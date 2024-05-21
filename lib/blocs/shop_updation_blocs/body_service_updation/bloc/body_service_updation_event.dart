part of 'body_service_updation_bloc.dart';

sealed class BodyServiceUpdationEvent {}

class FetchDatatoBodyServicePage extends BodyServiceUpdationEvent {}

class BodyServiceUpdationAddingPressed extends BodyServiceUpdationEvent {
  final String serviceName;

  BodyServiceUpdationAddingPressed({required this.serviceName});
}

class BodyServiceUpdationSavePressed extends BodyServiceUpdationEvent {}

class BodyEnableButtonPressedUpdation extends BodyServiceUpdationEvent {
  final String serviceName;

  BodyEnableButtonPressedUpdation({required this.serviceName});
}
