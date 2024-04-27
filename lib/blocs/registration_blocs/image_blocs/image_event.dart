part of 'image_bloc.dart';

sealed class ImageEvent {}

class LicencseImagePicker extends ImageEvent {}

class MMImagePicker extends ImageEvent {}

class BannerImagePicker extends ImageEvent {}

class LogoImagePicker extends ImageEvent {}
