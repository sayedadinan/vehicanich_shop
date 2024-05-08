import 'package:bloc/bloc.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
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
}
