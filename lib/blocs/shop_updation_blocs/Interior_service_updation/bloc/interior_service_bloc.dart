import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';

part 'interior_service_event.dart';
part 'interior_service_state.dart';

class InteriorServiceUpdationBloc
    extends Bloc<InteriorServiceEvent, InteriorServiceUpdationState> {
  InteriorServiceUpdationBloc()
      : super(InteriorServiceInitial(servicesFromFirebase: [])) {
    on<FetchDatatoInteriorServicePage>(fetchInteriorServiceFromFireBase);
    on<InteriorServiceUpdationAddingPressed>(
        serviceupdationaddingbuttonpressed);
    on<InteriorServiceUpdationSavePressed>(interiorServiceUpdationSavePressed);
    on<InteriorEnableButtonPressedUpdation>(enableButtonPressed);
  }
  fetchInteriorServiceFromFireBase(FetchDatatoInteriorServicePage event,
      Emitter<InteriorServiceUpdationState> emit) async {
    try {
      final collection = await CurrentShopCollection().currentShopCollections();
      final shopData = collection;
      final List<dynamic> fromFireBase =
          shopData[Referencekeys.interiorservicemap];
      emit(InteriorServiceInitial(servicesFromFirebase: fromFireBase));
    } catch (e) {
      print(e);
    }
  }

  serviceupdationaddingbuttonpressed(InteriorServiceUpdationAddingPressed event,
      Emitter<InteriorServiceUpdationState> emit) async {
    try {
      List<dynamic> cardTexts = [];
      if (cardTexts.contains(event.serviceName)) {
        print('value already exist');
      } else {
        cardTexts.add(event.serviceName);
        state.servicesFromFirebase.addAll(cardTexts);
        emit(InteriorServiceInitial(
            servicesFromFirebase: state.servicesFromFirebase));
      }
    } catch (e) {
      print('its a problem $e');
    }
  }

  interiorServiceUpdationSavePressed(InteriorServiceUpdationSavePressed event,
      Emitter<InteriorServiceUpdationState> emit) async {
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
        final existingSet =
            Set.from(existingData[Referencekeys.interiorservicemap]);
        final serviceSet = Set.from(state.servicesFromFirebase);
        final updatedSet = {...existingSet, ...serviceSet};
        existingData[Referencekeys.interiorservicemap] = updatedSet.toList();
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

  enableButtonPressed(InteriorEnableButtonPressedUpdation event,
      Emitter<InteriorServiceUpdationState> emit) async {
    List<dynamic> carryingNow = [...state.servicesFromFirebase];
    carryingNow.remove(event.serviceName);
    emit(InteriorServiceInitial(servicesFromFirebase: carryingNow));
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
          List<dynamic>.from(existingData[Referencekeys.interiorservicemap]);
      existingMap.remove(event.serviceName);
      await ShopreferenceId().shopCollectionReference().doc(docId).update({
        Referencekeys.interiorservicemap: existingMap,
      });

      print('removed');
    }
  }
}
