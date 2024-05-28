import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';
part 'date_change_event.dart';
part 'date_change_state.dart';

class DateChangeBloc extends Bloc<DateChangeEvent, DateChangeState> {
  DateChangeBloc() : super(DateChangeInitial()) {
    on<DateAdded>(dateaddingevent);
  }
  dateaddingevent(DateAdded event, Emitter<DateChangeState> emit) async {
    try {
      final shopid = FirebaseDatastoring.shopid;
      final reference = ShopreferenceId()
          .shopCollectionReference()
          .doc(shopid)
          .collection(Referencekeys.offDay)
          .doc();
      reference.set({
        "offDate": event.offDate,
      });
      log('successfully added');
    } catch (e) {
      log('there is some error$e');
    }
  }
}
