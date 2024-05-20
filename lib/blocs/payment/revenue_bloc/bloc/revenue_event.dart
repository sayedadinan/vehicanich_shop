part of 'revenue_bloc.dart';

sealed class RevenueEvent {}

class FetchMyRevenue extends RevenueEvent {}

class TotalRevenue extends RevenueEvent {
  final String amount;

  TotalRevenue({required this.amount});
}
