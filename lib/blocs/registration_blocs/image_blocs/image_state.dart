part of 'image_bloc.dart';

sealed class ImageState {
  final String licenceimagepath;
  final Uint8List? licenceimagepathunit;
  final String mmimagepath;
  final Uint8List? mmimagepathunit;
  final String bannerimagepath;
  final Uint8List? bannerimagepathunit;
  final String logoimagepath;
  ImageState({
    required this.licenceimagepath,
    required this.logoimagepath,
    required this.mmimagepath,
    required this.bannerimagepath,
    required this.licenceimagepathunit,
    required this.mmimagepathunit,
    required this.bannerimagepathunit,
  });
}

final class ImageInitial extends ImageState {
  ImageInitial({
    required super.logoimagepath,
    required super.licenceimagepath,
    required super.mmimagepath,
    required super.bannerimagepath,
    required super.licenceimagepathunit,
    required super.mmimagepathunit,
    required super.bannerimagepathunit,
  });
}
