import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBLoc extends Bloc<LocationEvent, LocationState> {
  LocationBLoc()
      : super(LocationInitialState(address: "", latLng: const LatLng(0, 0))) {
    on<LocationButtonPressed>(locationbuttonpressed);
    on<LocationPickerTaped>(locationpickertaped);
    on<ShopLocationPicked>(shoplocationpicked);
  }
  locationbuttonpressed(
      LocationButtonPressed event, Emitter<LocationState> emit) async {
    final permissionchecking = await Permission.location.request();
    if (permissionchecking.isGranted) {
      emit(LocationFetchingLoading(
          address: state.address, latLng: state.latLng));
      Position position = await Geolocator.getCurrentPosition();
      emit(CurrentLocationFetched(
          address: state.address,
          picker: LatLng(position.latitude, position.longitude),
          latLng: state.latLng));
    }
  }

  locationpickertaped(LocationPickerTaped event, Emitter<LocationState> emit) {
    emit(CurrentLocationFetched(
        latLng: state.latLng,
        picker: LatLng(event.newpositionpicker.latitude,
            event.newpositionpicker.longitude),
        address: state.address));
  }

  shoplocationpicked(
      ShopLocationPicked event, Emitter<LocationState> emit) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          event.position.latitude, event.position.longitude);
      if (placemarks.isNotEmpty) {
        String address =
            "${placemarks.first.locality},${placemarks.first.administrativeArea},${placemarks.first.country}";
        emit(LocationInitialState(
            address: address,
            latLng: LatLng(event.position.latitude, event.position.longitude)));
      }
    } catch (e) {
      print('error is there taking placemark $e');
    }
  }
}
