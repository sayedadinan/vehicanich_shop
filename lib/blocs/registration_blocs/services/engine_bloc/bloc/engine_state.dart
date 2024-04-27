part of 'engine_bloc.dart';

sealed class EngineState {
  final Map<String, dynamic> serviceNamemap;
  List<String> newmpty;

  EngineState({required this.serviceNamemap, required this.newmpty});
}

final class EngineInitial extends EngineState {
  EngineInitial({required super.serviceNamemap, required super.newmpty});
}

class EngineEnableBUttonValueAdded extends EngineState {
  EngineEnableBUttonValueAdded(
      {required super.serviceNamemap, required super.newmpty});
}

class EngineServiceremove extends EngineState {
  EngineServiceremove({required super.newmpty, required super.serviceNamemap});
}
