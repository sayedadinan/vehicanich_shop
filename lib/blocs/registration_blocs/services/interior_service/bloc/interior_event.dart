part of 'interior_bloc.dart';

sealed class InteriorEvent {}

class InteriorEnableButtonPressed extends InteriorEvent {
  final List<String> Selectedservices;

  InteriorEnableButtonPressed({required this.Selectedservices});
}

class InteriorServiceAddingButtonPressed extends InteriorEvent {
  final List<String> Selectedservices;

  InteriorServiceAddingButtonPressed({required this.Selectedservices});
}
