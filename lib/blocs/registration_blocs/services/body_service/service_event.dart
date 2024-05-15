part of 'service_bloc.dart';

sealed class ServiceEvent {}

class BodymaintaincePressed extends ServiceEvent {}

class BodyEnableButtonPressed extends ServiceEvent {
  final String serviceName;

  BodyEnableButtonPressed({required this.serviceName});
}

class BodyServiceAddingButtonPressed extends ServiceEvent {
  final List<String> Selectedservices;

  BodyServiceAddingButtonPressed({required this.Selectedservices});
}

class AddServiceWithRate extends ServiceEvent {
  final String serviceName;
  final int rate;

  AddServiceWithRate({required this.serviceName, required this.rate});
}
