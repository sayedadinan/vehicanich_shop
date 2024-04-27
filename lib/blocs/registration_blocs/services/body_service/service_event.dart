part of 'service_bloc.dart';

sealed class ServiceEvent {}

class BodymaintaincePressed extends ServiceEvent {}

class BodyEnableButtonPressed extends ServiceEvent {
  final String serviceName;
  final dynamic rate;
  BodyEnableButtonPressed({required this.serviceName, required this.rate});
}

class BodyServiceAddingButtonPressed extends ServiceEvent {
  final String newservicename;
  final dynamic serviceRate;
  BodyServiceAddingButtonPressed(
      {required this.newservicename, required this.serviceRate});
}

class AddServiceWithRate extends ServiceEvent {
  final String serviceName;
  final int rate;

  AddServiceWithRate({required this.serviceName, required this.rate});
}
