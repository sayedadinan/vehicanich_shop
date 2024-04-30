import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:vehicanich_shop/screens/register_screen/register_screen.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBLoc, LocationState>(
        builder: (context, state) {
          if (state is CurrentLocationFetched) {
            print('this worked');
            return Stack(
              children: [
                GoogleMap(
                  onTap: (argument) {
                    context
                        .read<LocationBLoc>()
                        .add(LocationPickerTaped(newpositionpicker: argument));
                  },
                  initialCameraPosition: CameraPosition(
                    target: state.picker,
                    zoom: 13,
                  ),
                  markers: {
                    Marker(
                        markerId: const MarkerId("marker location"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: state.picker)
                  },
                ),
                Positioned(
                  bottom: Mymediaquery().mediaqueryheight(0.06, context),
                  right: Mymediaquery().mediaquerywidth(0.17, context),
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<LocationBLoc>()
                          .add(ShopLocationPicked(position: state.picker));
                      Navigator.of(context).pushReplacement(
                          FadeTransitionPageRoute(
                              child: const RegisterScreen()));
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: Mymediaquery().mediaqueryheight(0.06, context),
                      width: Mymediaquery().mediaquerywidth(0.13, context),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Appallcolor().appbarbackgroundcolor,
                        ),
                        color: Appallcolor().textcolor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: const Center(
                        child: Text('Drop here'),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
