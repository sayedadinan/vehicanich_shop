part of 'date_change_bloc.dart';

sealed class DateChangeEvent {}

class DateAdded extends DateChangeEvent {
  final DateTime offDate;

  DateAdded({required this.offDate});
}
