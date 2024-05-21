part of 'engine_service_bloc.dart';

sealed class EngineServiceUpdationEvent {}

class FetchDatatoEngineServicePage extends EngineServiceUpdationEvent {}

class EngineServiceUpdationAddingPressed extends EngineServiceUpdationEvent {
  final String serviceName;

  EngineServiceUpdationAddingPressed({required this.serviceName});
}

class EngineServiceUpdationSavePressed extends EngineServiceUpdationEvent {}

class EngineEnableButtonPressedUpdation extends EngineServiceUpdationEvent {
  final String serviceName;

  EngineEnableButtonPressedUpdation({required this.serviceName});
}
