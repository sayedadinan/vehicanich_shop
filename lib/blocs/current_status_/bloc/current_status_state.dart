part of 'current_status_bloc.dart';

sealed class CurrentStatusState {}

final class CurrentStatusInitial extends CurrentStatusState {}

class StartedSucces extends CurrentStatusState {}

class StartedLoading extends CurrentStatusState {}

class StartedError extends CurrentStatusState {}

class CompletedSucces extends CurrentStatusState {}

class CompletedLoading extends CurrentStatusState {}

class CompletedError extends CurrentStatusState {}
