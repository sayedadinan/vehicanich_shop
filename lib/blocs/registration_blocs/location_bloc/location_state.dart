part of 'location_bloc.dart';

sealed class LocationState {
  final String address;
  final LatLng latLng;

  LocationState({
    required this.address,
    required this.latLng,
  });
}

class LocationInitialState extends LocationState {
  LocationInitialState({
    required String address,
    required LatLng latLng,
  }) : super(address: address, latLng: latLng);
}

class LocationFetchingLoading extends LocationState {
  LocationFetchingLoading({
    required String address,
    required LatLng latLng,
  }) : super(address: address, latLng: latLng);
}

class NavigateToLocation extends LocationState {
  NavigateToLocation({
    required String address,
    required LatLng latLng,
  }) : super(address: address, latLng: latLng);
}

class CurrentLocationFetched extends LocationState {
  final LatLng picker;

  CurrentLocationFetched(
      {required String address, required LatLng latLng, required this.picker})
      : super(address: address, latLng: latLng);
}
