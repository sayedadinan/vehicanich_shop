part of 'location_bloc.dart';

sealed class LocationEvent {}

class LocationButtonPressed extends LocationEvent {}

class LocationPickerTaped extends LocationEvent {
  final LatLng newpositionpicker;

  LocationPickerTaped({required this.newpositionpicker});
}

class ShopLocationPicked extends LocationEvent {
  final LatLng position;

  ShopLocationPicked({required this.position});
}
