import 'package:bloc/bloc.dart';
// import 'package:vehicanich_shop/data/data_provider/keys.dart';
// import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
// import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';
part 'revenue_event.dart';
part 'revenue_state.dart';

class RevenueBloc extends Bloc<RevenueEvent, RevenueState> {
  RevenueBloc() : super(RevenueInitial()) {
    on<FetchMyRevenue>(fetchmyRevenue);
  }
  fetchmyRevenue(FetchMyRevenue event, Emitter<RevenueState> emit) async {
    try {
      // final shopRevenueReference = await ShopreferenceId()
      //     .shopCollectionReference()
      //     .doc(FirebaseDatastoring.shopid)
      //     .collection(Referencekeys.wallet)
      //     .doc()
      //     .get();
      // dynamic value = int.parse(shopRevenueReference['money']);
      // dynamic revenue +=value;
    } catch (e) {}
  }
}
