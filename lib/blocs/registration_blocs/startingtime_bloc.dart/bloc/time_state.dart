part of 'time_bloc.dart';

sealed class TimeState {
  final String startingTime;

  TimeState({required this.startingTime});
}

final class TimeInitial extends TimeState {
  TimeInitial({required super.startingTime});
}

class StartingTimeSelected extends TimeState {
  StartingTimeSelected({required super.startingTime});
}
