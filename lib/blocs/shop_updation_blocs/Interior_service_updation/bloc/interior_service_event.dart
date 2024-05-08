part of 'interior_service_bloc.dart';

sealed class InteriorServiceEvent {}

class FetchDatatoInteriorServicePage extends InteriorServiceEvent {}

class InteriorServiceUpdationAddingPressed extends InteriorServiceEvent {
  final String serviceName;
  final dynamic serviceRate;

  InteriorServiceUpdationAddingPressed(
      {required this.serviceName, required this.serviceRate});
}

class InteriorServiceUpdationSavePressed extends InteriorServiceEvent {}

class InteriorEnableButtonPressedUpdation extends InteriorServiceEvent {
  final String serviceName;
  final dynamic serviceRate;

  InteriorEnableButtonPressedUpdation(
      {required this.serviceName, required this.serviceRate});
}
