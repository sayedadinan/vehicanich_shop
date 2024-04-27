part of 'closingtime_bloc.dart';

sealed class ClosingtimeState {
  final String closingTime;

  ClosingtimeState({required this.closingTime});
}

final class ClosingtimeInitial extends ClosingtimeState {
  ClosingtimeInitial({required super.closingTime});
}

class ClosingTimeSelected extends ClosingtimeState {
  ClosingTimeSelected({required super.closingTime});
}
