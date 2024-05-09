import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
part 'engine_service_event.dart';
part 'engine_service_state.dart';

class EngineServiceUpdationBloc
    extends Bloc<EngineServiceUpdationEvent, EngineServiceUpdationState> {
  EngineServiceUpdationBloc()
      : super(EngineServiceInitial(servicesFromFirebase: {})) {
    on<FetchDatatoEngineServicePage>(fetchDatatoEnginePage);
    on<EngineServiceUpdationAddingPressed>(engineServiceUpdationAddingPressed);
    on<EngineServiceUpdationSavePressed>(engineServiceUpdationSavePressed);
    on<EngineEnableButtonPressedUpdation>(engineEnableButtonPresedUpdation);
  }
  fetchDatatoEnginePage(FetchDatatoEngineServicePage event,
      Emitter<EngineServiceUpdationState> emit) async {
    try {
      final collection = await CurrentShopCollection().currentShopCollections();
      final shopData = collection;
      final Map<String, dynamic> fromFireBase =
          shopData[Referencekeys.enginservicemap];
      emit(EngineServiceInitial(servicesFromFirebase: fromFireBase));
    } catch (e) {
      print(e);
    }
  }

  engineServiceUpdationAddingPressed(EngineServiceUpdationAddingPressed event,
      Emitter<EngineServiceUpdationState> emit) {
    try {
      Map<String, dynamic> cardTexts = {};
      if (cardTexts.containsKey(event.serviceName)) {
        print('value already exist');
      } else {
        cardTexts.putIfAbsent(event.serviceName, () => event.serviceRate);
        state.servicesFromFirebase.addAll(cardTexts);
        emit(EngineServiceInitial(
            servicesFromFirebase: state.servicesFromFirebase));
      }
    } catch (e) {
      print('its a problem $e');
    }
  }

  engineServiceUpdationSavePressed(EngineServiceUpdationSavePressed event,
      Emitter<EngineServiceUpdationState> emit) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final phone = pref.getString(Referencekeys.shopPhone);
      if (phone == null || phone.isEmpty) {
        return;
      }
      final collection = ShopreferenceId()
          .shopCollectionReference()
          .where(Referencekeys.phone, isEqualTo: phone);
      final snapshot = await collection.get();
      if (snapshot.docs.isNotEmpty) {
        final docId = snapshot.docs.first.id;
        final existingData = snapshot.docs.first.data();
        final existingMap = existingData[Referencekeys.enginservicemap];
        final updatedMap = Map<String, dynamic>.from(existingMap)
          ..addAll(state.servicesFromFirebase);
        existingData[Referencekeys.enginservicemap] = updatedMap;
        await ShopreferenceId()
            .shopCollectionReference()
            .doc(docId)
            .update(existingData);
      }
      print('successfully updated');
    } catch (e) {
      print('error when try to update $e');
    }
  }

  engineEnableButtonPresedUpdation(EngineEnableButtonPressedUpdation event,
      Emitter<EngineServiceUpdationState> emit) async {
    Map<String, dynamic> carryingNow = {...state.servicesFromFirebase};
    carryingNow.remove(event.serviceName);
    emit(EngineServiceInitial(servicesFromFirebase: carryingNow));
    final pref = await SharedPreferences.getInstance();
    final phone = pref.getString(Referencekeys.shopPhone);
    if (phone == null || phone.isEmpty) {
      return;
    }
    final collection = ShopreferenceId()
        .shopCollectionReference()
        .where(Referencekeys.phone, isEqualTo: phone);
    final snapshot = await collection.get();
    if (snapshot.docs.isNotEmpty) {
      final docId = snapshot.docs.first.id;
      final existingData = snapshot.docs.first.data();
      final existingMap = Map<String, dynamic>.from(
          existingData[Referencekeys.enginservicemap]);
      existingMap.remove(event.serviceName);
      await ShopreferenceId().shopCollectionReference().doc(docId).update({
        Referencekeys.enginservicemap: existingMap,
      });

      print('removed');
    }
  }
}
