part of 'emergency_bloc.dart';

sealed class EmergencyEvent {}

class EmergencymaintaincePressed extends EmergencyEvent {}

class EmergencyEnableButtonPressed extends EmergencyEvent {
  final String serviceName;

  EmergencyEnableButtonPressed({required this.serviceName});
}

class EmergencyServiceAddingButtonPressed extends EmergencyEvent {
  final String newservicename;

  EmergencyServiceAddingButtonPressed({required this.newservicename});
}
