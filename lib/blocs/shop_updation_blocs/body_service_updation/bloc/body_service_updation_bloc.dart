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
      : super(BodyServiceUpdationInitial(servicesFromFirebase: [])) {
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
      final List<dynamic> fromFireBase = shopData[Referencekeys.bodyservicemap];
      emit(BodyServiceUpdationInitial(servicesFromFirebase: fromFireBase));
    } catch (e) {
      print(e);
    }
  }

  serviceupdationaddingbuttonpressed(BodyServiceUpdationAddingPressed event,
      Emitter<BodyServiceUpdationState> emit) async {
    try {
      List<dynamic> cardText = [];
      if (cardText.contains(event.serviceName)) {
        print('value already exist');
      } else {
        cardText.add(event.serviceName);
        state.servicesFromFirebase.addAll(cardText);
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
        final existingSet = Set.from(existingData[
            Referencekeys.bodyservicemap]); // Assuming existingData is a map
        final serviceSet = Set.from(state
            .servicesFromFirebase); // Convert servicesFromFirebase to a set
        final updatedSet = {...existingSet, ...serviceSet};
        existingData[Referencekeys.bodyservicemap] = updatedSet
            .toList(); // Update existingData with the merged set converted back to a list

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
    List<dynamic> carryingNow = [...state.servicesFromFirebase];
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
      List<dynamic> existingList =
          List<dynamic>.from(existingData[Referencekeys.bodyservicemap]);
      existingList.remove(event.serviceName);

      await ShopreferenceId().shopCollectionReference().doc(docId).update({
        Referencekeys.bodyservicemap: existingList,
      });

      print('removed');
    }
  }
}
