part of 'emergency_bloc.dart';

sealed class EmergencyState {
  final List<String> serviceNameList;
  final List<String> newmpty;

  EmergencyState({required this.serviceNameList, required this.newmpty});
}

final class EmergencyInitial extends EmergencyState {
  EmergencyInitial({required super.serviceNameList, required super.newmpty});
}

class NavigatetoEmergencyservice extends EmergencyState {
  NavigatetoEmergencyservice(
      {required super.serviceNameList, required super.newmpty});
}

class EmergencyEnableBUttonValueAdded extends EmergencyState {
  EmergencyEnableBUttonValueAdded(
      {required super.serviceNameList, required super.newmpty});
}

class EmergencyServiceremove extends EmergencyState {
  EmergencyServiceremove(
      {required super.newmpty, required super.serviceNameList});
}
