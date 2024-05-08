// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
part 'body_service_updation_event.dart';
part 'body_service_updation_state.dart';

class BodyServiceUpdationBloc
    extends Bloc<BodyServiceUpdationEvent, BodyServiceUpdationState> {
  BodyServiceUpdationBloc()
      : super(BodyServiceUpdationInitial(servicesFromFirebase: {})) {
    on<FetchDatatoBodyServicePage>(fetchBodyServiceFromFireBase);
    on<BodyServiceUpdationAddingPressed>(serviceupdationaddingbuttonpressed);
    on<BodyServiceUpdationSavePressed>(bodyServiceUpdationSavePressed);
    on<BodyEnableButtonPressedUpdation>(enableButtonPressed);
  }
  fetchBodyServiceFromFireBase(FetchDatatoBodyServicePage event,
      Emitter<BodyServiceUpdationState> emit) async {
    try {
      final collection = await CurrentShopCollection().currentShopCollections();
      final shopData = collection;
      final Map<String, dynamic> fromFireBase =
          shopData[Referencekeys.bodyservicemap];
      emit(BodyServiceUpdationInitial(servicesFromFirebase: fromFireBase));
    } catch (e) {
      print(e);
    }
  }

  serviceupdationaddingbuttonpressed(BodyServiceUpdationAddingPressed event,
      Emitter<BodyServiceUpdationState> emit) async {
    try {
      Map<String, dynamic> cardTexts = {};
      if (cardTexts.containsKey(event.serviceName)) {
        print('value already exist');
      } else {
        cardTexts.putIfAbsent(event.serviceName, () => event.serviceRate);
        state.servicesFromFirebase.addAll(cardTexts);
        emit(BodyServiceUpdationInitial(
            servicesFromFirebase: state.servicesFromFirebase));
      }
    } catch (e) {
      print('its a problem $e');
    }
  }

  bodyServiceUpdationSavePressed(BodyServiceUpdationSavePressed event,
      Emitter<BodyServiceUpdationState> emit) async {
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
        final existingMap = existingData[Referencekeys.bodyservicemap];
        final updatedMap = Map<String, dynamic>.from(existingMap)
          ..addAll(state.servicesFromFirebase);
        existingData[Referencekeys.bodyservicemap] = updatedMap;
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

  enableButtonPressed(BodyEnableButtonPressedUpdation event,
      Emitter<BodyServiceUpdationState> emit) async {
    Map<String, dynamic> carryingNow = {...state.servicesFromFirebase};
    carryingNow.remove(event.serviceName);
    emit(BodyServiceUpdationInitial(servicesFromFirebase: carryingNow));
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
      final existingMap =
          Map<String, dynamic>.from(existingData[Referencekeys.bodyservicemap]);
      existingMap.remove(event.serviceName);
      await ShopreferenceId().shopCollectionReference().doc(docId).update({
        Referencekeys.bodyservicemap: existingMap,
      });

      print('removed');
    }
  }
}
