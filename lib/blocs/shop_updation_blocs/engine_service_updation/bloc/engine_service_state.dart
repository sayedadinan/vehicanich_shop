part of 'engine_service_bloc.dart';

sealed class EngineServiceUpdationState {
  Map<String, dynamic> servicesFromFirebase = {};
  EngineServiceUpdationState({required this.servicesFromFirebase});
}

final class EngineServiceInitial extends EngineServiceUpdationState {
  EngineServiceInitial({required super.servicesFromFirebase});
}
