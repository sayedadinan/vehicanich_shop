part of 'starting_time_updation_bloc.dart';

sealed class StartingTimeUpdationEvent {}

class StartingUpdationTimePicked extends StartingTimeUpdationEvent {
  final TimeOfDay selectedstartingTime;

  StartingUpdationTimePicked({required this.selectedstartingTime});
}

class StartingTimeFetching extends StartingTimeUpdationEvent {}
