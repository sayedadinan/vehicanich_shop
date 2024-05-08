part of 'user_profile_bloc.dart';

sealed class UserProfileState {
  final String shopImage;
  final String userName;
  final String email;
  final String password;
  final String whatsapp;
  UserProfileState({
    required this.shopImage,
    required this.userName,
    required this.email,
    required this.password,
    required this.whatsapp,
  });
}

final class UserProfileInitial extends UserProfileState {
  UserProfileInitial({
    required super.shopImage,
    required super.userName,
    required super.email,
    required super.password,
    required super.whatsapp,
  });
}
