part of 'interior_service_bloc.dart';

sealed class InteriorServiceUpdationState {
  List<dynamic> servicesFromFirebase = [];
  InteriorServiceUpdationState({required this.servicesFromFirebase});
}

final class InteriorServiceInitial extends InteriorServiceUpdationState {
  InteriorServiceInitial({required super.servicesFromFirebase});
}
