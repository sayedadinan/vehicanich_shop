part of 'service_bloc.dart';

sealed class ServiceState {
  final Map<String, dynamic> serviceNamemap;
  Map<String, dynamic> servicenameandrate;
  final List<String> newmpty;
  ServiceState({
    required this.newmpty,
    required this.serviceNamemap,
    required this.servicenameandrate,
  });
}

final class ServiceInitial extends ServiceState {
  ServiceInitial(
      {required super.serviceNamemap,
      required super.newmpty,
      required super.servicenameandrate});
}

class NavigatetoBodyservice extends ServiceState {
  NavigatetoBodyservice(
      {required super.serviceNamemap,
      required super.newmpty,
      required super.servicenameandrate});
}

class BodyEnableBUttonValueAdded extends ServiceState {
  BodyEnableBUttonValueAdded(
      {required super.serviceNamemap,
      required super.newmpty,
      required super.servicenameandrate});
}

class BodyServiceremove extends ServiceState {
  BodyServiceremove(
      {required super.newmpty,
      required super.serviceNamemap,
      required super.servicenameandrate});
}
