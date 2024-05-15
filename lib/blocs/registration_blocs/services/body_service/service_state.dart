part of 'service_bloc.dart';

sealed class ServiceState {
  Map<String, dynamic> servicenameandrate;
  final List<String> newmpty;
  final List<String> servicesList;
  ServiceState({
    required this.newmpty,
    required this.servicenameandrate,
    required this.servicesList,
  });
}

final class ServiceInitial extends ServiceState {
  ServiceInitial({
    required super.newmpty,
    required super.servicenameandrate,
    required super.servicesList,
  });
}

class NavigatetoBodyservice extends ServiceState {
  NavigatetoBodyservice({
    required super.newmpty,
    required super.servicenameandrate,
    required super.servicesList,
  });
}

class BodyEnableBUttonValueAdded extends ServiceState {
  BodyEnableBUttonValueAdded({
    required super.newmpty,
    required super.servicenameandrate,
    required super.servicesList,
  });
}

class BodyServiceremove extends ServiceState {
  BodyServiceremove({
    required super.newmpty,
    required super.servicenameandrate,
    required super.servicesList,
  });
}
