part of 'engine_service_bloc.dart';

sealed class EngineServiceUpdationState {
  List<dynamic> servicesFromFirebase = [];
  EngineServiceUpdationState({required this.servicesFromFirebase});
}

final class EngineServiceInitial extends EngineServiceUpdationState {
  EngineServiceInitial({required super.servicesFromFirebase});
}
