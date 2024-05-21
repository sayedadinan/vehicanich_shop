import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';

part 'total_bill_event.dart';
part 'total_bill_state.dart';

class TotalBillBloc extends Bloc<TotalBillEvent, TotalBillState> {
  TotalBillBloc() : super(TotalBillInitial()) {
    on<TotalBillAdded>(totalBillAdded);
  }
  totalBillAdded(TotalBillAdded event, Emitter<TotalBillState> emit) async {
    try {
      final shopid = FirebaseDatastoring.shopid;
      final reference = ShopreferenceId()
          .shopCollectionReference()
          .doc(shopid)
          .collection(Referencekeys.totalBill)
          .doc();
      reference.set({
        "extraServices": event.extraService,
        "extraFitting": event.extraFitting,
        "totalAmount": event.totalAmount,
        "customerId": event.customerId,
        "serviceName": event.serviceName,
        "vehicleNumber": event.vehicleNumber
      });
      log('successfully added');
    } catch (e) {
      log('there is some error$e');
    }
  }
}
