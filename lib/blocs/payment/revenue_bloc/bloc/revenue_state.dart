part of 'revenue_bloc.dart';

sealed class RevenueState {
  final int balanceAmount;

  RevenueState({required this.balanceAmount});
}

final class RevenueInitial extends RevenueState {
  RevenueInitial({required super.balanceAmount});
}
