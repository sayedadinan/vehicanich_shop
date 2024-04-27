part of 'time_bloc.dart';

sealed class TimeEvent {}

class StartingTimePicked extends TimeEvent {
  final TimeOfDay selectedstartingTime;

  StartingTimePicked({required this.selectedstartingTime});
}
