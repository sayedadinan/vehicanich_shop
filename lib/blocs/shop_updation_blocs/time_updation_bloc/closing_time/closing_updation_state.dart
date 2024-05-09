part of 'closing_updation_bloc.dart';

@immutable
sealed class ClosingUpdationState {
  final String clsoingTime;

  ClosingUpdationState({required this.clsoingTime});
}

final class ClosingUpdationInitial extends ClosingUpdationState {
  ClosingUpdationInitial({required super.clsoingTime});
}

final class ClosingTimeUpdationInitial extends ClosingUpdationState {
  ClosingTimeUpdationInitial({required super.clsoingTime});
}

class ClosingTimeUpdationSelected extends ClosingUpdationState {
  ClosingTimeUpdationSelected({required super.clsoingTime});
}
