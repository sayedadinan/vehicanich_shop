import 'package:bloc/bloc.dart';
part 'revenue_event.dart';
part 'revenue_state.dart';

class RevenueBloc extends Bloc<RevenueEvent, RevenueState> {
  RevenueBloc() : super(RevenueInitial(balanceAmount: 0)) {
    on<TotalRevenue>(totalRevenueCounting);
  }
  totalRevenueCounting(TotalRevenue event, Emitter<RevenueState> emit) {
    try {
      int converted = int.tryParse(event.amount) ?? 0;
      int totalAmount = state.balanceAmount + converted;
      emit(RevenueInitial(balanceAmount: totalAmount));
      // state.balanceAmount += converted;
    } catch (e) {}
  }
}
