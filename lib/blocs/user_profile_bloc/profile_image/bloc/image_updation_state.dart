part of 'image_updation_bloc.dart';

sealed class ImageUpdationState {
  final Uint8List? profileUpdationImageUnit;
  final String previosImagePath;
  final String newImagePath;

  ImageUpdationState({
    required this.profileUpdationImageUnit,
    required this.previosImagePath,
    required this.newImagePath,
  });
}

final class ImageUpdationInitial extends ImageUpdationState {
  ImageUpdationInitial({
    required super.profileUpdationImageUnit,
    required super.previosImagePath,
    required super.newImagePath,
  });
}
