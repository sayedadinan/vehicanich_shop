part of 'current_status_bloc.dart';

sealed class CurrentStatusEvent {}

class StartedbuttonPressed extends CurrentStatusEvent {
  final String documentId;

  StartedbuttonPressed({required this.documentId});
}

class CompletedbuttonPressed extends CurrentStatusEvent {
  final String documentId;

  CompletedbuttonPressed({required this.documentId});
}

class DoneButtonPressed extends CurrentStatusEvent {
  final String documentId;

  DoneButtonPressed({required this.documentId});
}
