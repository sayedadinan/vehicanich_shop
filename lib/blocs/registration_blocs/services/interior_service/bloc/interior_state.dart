part of 'interior_bloc.dart';

sealed class InteriorState {
  List<String> newmpty;
  final List<String> servicesList;
  InteriorState({
    required this.servicesList,
    required this.newmpty,
  });
}

final class InteriorInitial extends InteriorState {
  InteriorInitial({
    required super.servicesList,
    required super.newmpty,
  });
}

class InteriorEnableBUttonValueAdded extends InteriorState {
  InteriorEnableBUttonValueAdded({
    required super.newmpty,
    required super.servicesList,
  });
}

class InteriorServiceremove extends InteriorState {
  InteriorServiceremove({
    required super.servicesList,
    required super.newmpty,
  });
}
