part of 'image_updation_bloc.dart';

sealed class ImageUpdationEvent {}

class FetchingProfileImage extends ImageUpdationEvent {}

class ProfileImagePicked extends ImageUpdationEvent {}

class ProfileImageUpdationPressed extends ImageUpdationEvent {
  final BuildContext context;

  ProfileImageUpdationPressed({required this.context});
}
