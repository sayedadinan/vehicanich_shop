part of 'interior_bloc.dart';

sealed class InteriorEvent {}

class InteriorEnableButtonPressed extends InteriorEvent {
  final String serviceName;
  final dynamic rate;
  InteriorEnableButtonPressed({
    required this.serviceName,
    required this.rate,
  });
}

class InteriorServiceAddingButtonPressed extends InteriorEvent {
  final String newservicename;
  final dynamic rate;
  InteriorServiceAddingButtonPressed({
    required this.newservicename,
    required this.rate,
  });
}
