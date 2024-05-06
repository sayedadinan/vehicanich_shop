import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/image_blocs/image_bloc.dart';

class ImageChanging {
  licenceImageChanging(BuildContext context) async {
    try {
      firebase_storage.Reference reference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('licence_image')
          .child(BlocProvider.of<ImageBloc>(context).state.licenceimagepath);
      final meta = firebase_storage.SettableMetadata(contentType: "image/jpeg");
      await reference.putData(
          BlocProvider.of<ImageBloc>(context).state.licenceimagepathunit!,
          meta);
      String url = await reference.getDownloadURL();
      return url;
    } catch (e) {
      return 'there is a error when changing licence photo';
    }
  }

  mmImageChanging(BuildContext context) async {
    try {
      firebase_storage.Reference reference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('mm_image')
          .child(BlocProvider.of<ImageBloc>(context).state.mmimagepath);
      final meta = firebase_storage.SettableMetadata(contentType: "image/jpeg");
      await reference.putData(
          BlocProvider.of<ImageBloc>(context).state.mmimagepathunit!, meta);
      String url = await reference.getDownloadURL();
      return url;
    } catch (e) {
      return 'there is a error when changing mm photo';
    }
  }

  bannerImageChanging(BuildContext context) async {
    try {
      firebase_storage.Reference reference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('banner_image')
          .child(BlocProvider.of<ImageBloc>(context).state.bannerimagepath);
      final meta = firebase_storage.SettableMetadata(contentType: "image/jpeg");
      await reference.putData(
          BlocProvider.of<ImageBloc>(context).state.bannerimagepathunit!, meta);
      String url = await reference.getDownloadURL();
      return url;
    } catch (e) {
      return 'there is a error when changing banner photo';
    }
  }
}
