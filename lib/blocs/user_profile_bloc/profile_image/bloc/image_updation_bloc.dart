import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/data_provider/shop_booking_ref.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
part 'image_updation_event.dart';
part 'image_updation_state.dart';

class ImageUpdationBloc extends Bloc<ImageUpdationEvent, ImageUpdationState> {
  ImageUpdationBloc()
      : super(ImageUpdationInitial(
          newImagePath: '',
          previosImagePath: '',
          profileUpdationImageUnit: null,
        )) {
    on<FetchingProfileImage>(fetchProfileImage);
    on<ProfileImagePicked>(profileImagePicked);
    on<ProfileImageUpdationPressed>(profileImageUpdationpressed);
  }
  fetchProfileImage(
      FetchingProfileImage event, Emitter<ImageUpdationState> emit) async {
    final collection = await CurrentShopCollection().currentShopCollections();
    final userData = collection;
    emit(ImageUpdationInitial(
      newImagePath: '',
      profileUpdationImageUnit: null,
      previosImagePath: userData[Referencekeys.bannerImagePath],
    ));
  }

  profileImagePicked(
      ProfileImagePicked event, Emitter<ImageUpdationState> emit) async {
    final ImagePicker picker = ImagePicker();
    final bannerUpdationImage =
        await picker.pickImage(source: ImageSource.gallery);
    Uint8List bannerUpdationImageUnit =
        await bannerUpdationImage!.readAsBytes();
    emit(ImageUpdationInitial(
      newImagePath: bannerUpdationImage.name,
      profileUpdationImageUnit: bannerUpdationImageUnit,
      previosImagePath: state.previosImagePath,
    ));
  }

  profileImageUpdationpressed(ProfileImageUpdationPressed event,
      Emitter<ImageUpdationState> emit) async {
    try {
      print('this worked');
      firebase_storage.Reference reference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('updation_banner_image')
          .child(state.newImagePath);
      final meta = firebase_storage.SettableMetadata(contentType: "image/jpeg");
      await reference.putData(
          // BlocProvider.of<ImageUpdationBloc>(event.context, listen: false)
          state.profileUpdationImageUnit!,
          meta);
      String url = await reference.getDownloadURL();
      final pref = await SharedPreferences.getInstance();
      final phone = pref.getString(Referencekeys.shopPhone);
      if (phone == null || phone.isEmpty) {
        return;
      }
      final collection = ShopreferenceId()
          .shopCollectionReference()
          .where(Referencekeys.phone, isEqualTo: phone);
      final snapshot = await collection.get();
      final docId = snapshot.docs.first.id;
      await ShopreferenceId()
          .shopCollectionReference()
          .doc(docId)
          .update({Referencekeys.bannerImagePath: url});
    } catch (e) {
      return 'there is a error when updation photo $e';
    }
  }
}
