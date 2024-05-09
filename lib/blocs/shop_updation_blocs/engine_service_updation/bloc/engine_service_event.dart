part of 'engine_service_bloc.dart';

sealed class EngineServiceUpdationEvent {}

class FetchDatatoEngineServicePage extends EngineServiceUpdationEvent {}

class EngineServiceUpdationAddingPressed extends EngineServiceUpdationEvent {
  final String serviceName;
  final dynamic serviceRate;

  EngineServiceUpdationAddingPressed(
      {required this.serviceName, required this.serviceRate});
}

class EngineServiceUpdationSavePressed extends EngineServiceUpdationEvent {}

class EngineEnableButtonPressedUpdation extends EngineServiceUpdationEvent {
  final String serviceName;
  final dynamic serviceRate;

  EngineEnableButtonPressedUpdation(
      {required this.serviceName, required this.serviceRate});
}
