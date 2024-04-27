import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc()
      : super(ImageInitial(
            licenceimagepathunit: null,
            mmimagepathunit: null,
            bannerimagepathunit: null,
            bannerimagepath: '',
            licenceimagepath: '',
            mmimagepath: '',
            logoimagepath: '')) {
    on<LicencseImagePicker>(licenceimagepicker);
    on<MMImagePicker>(mmimagepicker);
    on<BannerImagePicker>(bannerimagepicker);
    on<LogoImagePicker>(logoimagepickerpicker);
  }
  licenceimagepicker(
      LicencseImagePicker event, Emitter<ImageState> emit) async {
    try {
      final ImagePicker picker = ImagePicker();
      final licenseImage = await picker.pickImage(source: ImageSource.gallery);
      Uint8List licenseImageData = await licenseImage!.readAsBytes();
      print(licenseImage);
      emit(
        ImageInitial(
          licenceimagepathunit: licenseImageData,
          bannerimagepathunit: state.bannerimagepathunit,
          mmimagepathunit: state.mmimagepathunit,
          logoimagepath: state.logoimagepath,
          bannerimagepath: state.bannerimagepath,
          licenceimagepath: licenseImage.path,
          mmimagepath: state.mmimagepath,
        ),
      );
    } catch (e) {
      print('licence image fetching error');
    }
  }

  mmimagepicker(MMImagePicker event, Emitter<ImageState> emit) async {
    try {
      final ImagePicker picker = ImagePicker();
      final mmimagepath = await picker.pickImage(source: ImageSource.gallery);
      Uint8List mmImageData = await mmimagepath!.readAsBytes();
      print(mmimagepath);
      emit(
        ImageInitial(
          licenceimagepathunit: state.licenceimagepathunit,
          bannerimagepathunit: state.bannerimagepathunit,
          mmimagepathunit: mmImageData,
          logoimagepath: state.logoimagepath,
          bannerimagepath: state.bannerimagepath,
          licenceimagepath: state.licenceimagepath,
          mmimagepath: mmimagepath.path,
        ),
      );
    } catch (e) {
      print('mm image fetching error');
    }
  }

  bannerimagepicker(BannerImagePicker event, Emitter<ImageState> emit) async {
    try {
      final ImagePicker picker = ImagePicker();
      final bannerpath = await picker.pickImage(source: ImageSource.gallery);
      Uint8List bannerImageData = await bannerpath!.readAsBytes();
      print(bannerpath);
      emit(
        ImageInitial(
          licenceimagepathunit: state.licenceimagepathunit,
          bannerimagepathunit: bannerImageData,
          mmimagepathunit: state.mmimagepathunit,
          logoimagepath: state.logoimagepath,
          bannerimagepath: bannerpath.path,
          licenceimagepath: state.licenceimagepath,
          mmimagepath: state.mmimagepath,
        ),
      );
    } catch (e) {
      print('bannerimage fetching error');
    }
  }

  logoimagepickerpicker(LogoImagePicker event, Emitter<ImageState> emit) async {
    try {
      final ImagePicker picker = ImagePicker();
      final logopath = await picker.pickImage(source: ImageSource.gallery);
      if (logopath != null) {
        print(logopath);
        emit(
          ImageInitial(
            licenceimagepathunit: state.licenceimagepathunit,
            bannerimagepathunit: state.bannerimagepathunit,
            mmimagepathunit: state.mmimagepathunit,
            logoimagepath: logopath.path,
            bannerimagepath: state.bannerimagepath,
            licenceimagepath: state.licenceimagepath,
            mmimagepath: state.mmimagepath,
          ),
        );
      }
    } catch (e) {
      print('logo fetching error');
    }
  }
}
