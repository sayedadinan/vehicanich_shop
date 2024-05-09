part of 'starting_time_updation_bloc.dart';

sealed class StartingTimeUpdationState {
  final String startingTime;

  StartingTimeUpdationState({required this.startingTime});
}

final class StartingTimeUpdationInitial extends StartingTimeUpdationState {
  StartingTimeUpdationInitial({required super.startingTime});
}

class StartingUpdationTimeSelected extends StartingTimeUpdationState {
  StartingUpdationTimeSelected({required super.startingTime});
}
