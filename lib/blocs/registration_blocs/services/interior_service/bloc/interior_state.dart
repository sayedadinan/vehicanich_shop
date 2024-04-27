part of 'interior_bloc.dart';

sealed class InteriorState {
  final Map<String, dynamic> serviceNamemap;
  List<String> newmpty;
  InteriorState({
    required this.serviceNamemap,
    required this.newmpty,
  });
}

final class InteriorInitial extends InteriorState {
  InteriorInitial({
    required super.serviceNamemap,
    required super.newmpty,
  });
}

class InteriorEnableBUttonValueAdded extends InteriorState {
  InteriorEnableBUttonValueAdded(
      {required super.serviceNamemap, required super.newmpty});
}

class InteriorServiceremove extends InteriorState {
  InteriorServiceremove({
    required super.newmpty,
    required super.serviceNamemap,
  });
}
