part of 'user_profile_bloc.dart';

sealed class UserProfileEvent {}

class FetchingProfileDetails extends UserProfileEvent {}

class UserProfileUpdateSavePressed extends UserProfileEvent {
  final String userName;
  final String whatsApp;
  final String email;
  final String password;

  UserProfileUpdateSavePressed({
    required this.userName,
    required this.whatsApp,
    required this.email,
    required this.password,
  });
}
