part of 'interior_service_bloc.dart';

sealed class InteriorServiceEvent {}

class FetchDatatoInteriorServicePage extends InteriorServiceEvent {}

class InteriorServiceUpdationAddingPressed extends InteriorServiceEvent {
  final String serviceName;

  InteriorServiceUpdationAddingPressed({required this.serviceName});
}

class InteriorServiceUpdationSavePressed extends InteriorServiceEvent {}

class InteriorEnableButtonPressedUpdation extends InteriorServiceEvent {
  final String serviceName;

  InteriorEnableButtonPressedUpdation({required this.serviceName});
}
