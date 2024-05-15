part of 'engine_bloc.dart';

sealed class EngineEvent {}

class EnginemaintaincePressed extends EngineEvent {}

class EngineEnableButtonPressed extends EngineEvent {
  final String serviceName;
  final dynamic rate;
  EngineEnableButtonPressed({
    required this.serviceName,
    required this.rate,
  });
}

class EngineServiceAddingButtonPressed extends EngineEvent {
  final List<String> Selectedservices;

  EngineServiceAddingButtonPressed({required this.Selectedservices});
}
