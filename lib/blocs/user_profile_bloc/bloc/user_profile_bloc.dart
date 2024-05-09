import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc()
      : super(UserProfileInitial(
            whatsapp: '',
            password: '',
            shopImage: '',
            userName: '',
            email: '')) {
    on<FetchingProfileDetails>(fetchingProfileDetails);
    on<UserProfileUpdateSavePressed>(userprofileUpdateSaving);
  }
  fetchingProfileDetails(
      FetchingProfileDetails event, Emitter<UserProfileState> emit) async {
    final collection = await CurrentShopCollection().currentShopCollections();
    final userData = collection;
    emit(UserProfileInitial(
        whatsapp: userData[Referencekeys.whatsapp],
        shopImage: userData[Referencekeys.bannerImagePath],
        userName: userData[Referencekeys.name],
        email: userData[Referencekeys.email],
        password: userData[Referencekeys.password]));
  }

  userprofileUpdateSaving(UserProfileUpdateSavePressed event,
      Emitter<UserProfileState> emit) async {
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
        await ShopreferenceId().shopCollectionReference().doc(docId).update({
          Referencekeys.name: event.userName,
          Referencekeys.email: event.email,
          Referencekeys.whatsapp: event.whatsApp,
          Referencekeys.password: event.password,
        });
        print('successfully updated');
      } else {
        // Handle case when no document is found for the phone number
      }
    } catch (e) {
      // Handle error
      print('there is a error in profile editing area $e');
    }
  }
}
