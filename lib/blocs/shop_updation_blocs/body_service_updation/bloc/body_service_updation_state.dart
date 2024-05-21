part of 'body_service_updation_bloc.dart';

sealed class BodyServiceUpdationState {
  List<dynamic> servicesFromFirebase;
  BodyServiceUpdationState({required this.servicesFromFirebase});
}

final class BodyServiceUpdationInitial extends BodyServiceUpdationState {
  BodyServiceUpdationInitial({required super.servicesFromFirebase});
}
