part of 'closing_updation_bloc.dart';

sealed class ClosingUpdationEvent {}

class ClosingUpdationTimePicked extends ClosingUpdationEvent {
  final TimeOfDay closingstartingTime;

  ClosingUpdationTimePicked({required this.closingstartingTime});
}

class ClosingTimeFetching extends ClosingUpdationEvent {}
