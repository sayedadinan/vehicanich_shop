import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:vehicanich_shop/data/services/revenue_total.dart';
part 'revenue_event.dart';
part 'revenue_state.dart';

class RevenueBloc extends Bloc<RevenueEvent, RevenueState> {
  RevenueBloc() : super(RevenueInitial(balanceAmount: 0)) {
    on<TotalRevenue>(totalRevenueCounting);
  }
  totalRevenueCounting(TotalRevenue event, Emitter<RevenueState> emit) async {
    try {
      final totalAmount = await RevenueTotal().totalRevenueCount();
      emit(RevenueInitial(balanceAmount: totalAmount));
    } catch (e) {
      log('there is a error in revenue bloc $e');
    }
  }
}
