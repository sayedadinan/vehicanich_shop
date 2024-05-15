part of 'engine_bloc.dart';

sealed class EngineState {
  final List<String> servicesList;
  List<String> newmpty;

  EngineState({
    required this.newmpty,
    required this.servicesList,
  });
}

final class EngineInitial extends EngineState {
  EngineInitial({required super.newmpty, required super.servicesList});
}

class EngineEnableBUttonValueAdded extends EngineState {
  EngineEnableBUttonValueAdded(
      {required super.newmpty, required super.servicesList});
}

class EngineServiceremove extends EngineState {
  EngineServiceremove({
    required super.newmpty,
    required super.servicesList,
  });
}
