part of 'closingtime_bloc.dart';

sealed class ClosingtimeEvent {}

class ClosingTimePicked extends ClosingtimeEvent {
  final TimeOfDay selectedclosingTime;

  ClosingTimePicked({required this.selectedclosingTime});
}
