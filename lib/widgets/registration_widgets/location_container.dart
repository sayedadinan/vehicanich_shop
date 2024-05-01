import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:vehicanich_shop/screens/map_screen/map_page.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';

class LocationTextContainer extends StatelessWidget {
  const LocationTextContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBLoc, LocationState>(
      listener: (context, state) {
        if (state is CurrentLocationFetched) {
          Navigator.of(context)
              .push(FadeTransitionPageRoute(child: const MapScreen()));
        }
      },
      builder: (context, state) {
        if (state is LocationFetchingLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return GestureDetector(
          onTap: () {
            context.read<LocationBLoc>().add(LocationButtonPressed());
          },
          child: Container(
            width: Mymediaquery().mediaquerywidth(0.9, context),
            height: Mymediaquery().mediaqueryheight(0.07, context),
            decoration: BoxDecoration(
              color: Appallcolor().placeholderimagecolor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: Mymediaquery().mediaquerywidth(0.05, context),
                ),
                if (state.address.isEmpty)
                  Text(
                    'choose your location',
                    style: TextStyle(
                      color: Appallcolor().colorblack,
                      fontSize: Mymediaquery().mediaquerywidth(0.05, context),
                    ),
                  ),
                if (state.address.isNotEmpty)
                  Text(
                    state.address,
                    style: TextStyle(
                      color: Appallcolor().colorblack,
                      fontSize: Mymediaquery().mediaquerywidth(0.05, context),
                    ),
                  ),
                // SizedBox(
                //   width: Mymediaquery().mediaquerywidth(0.06, context),
                // ),
                const Icon(Icons.location_on)
              ],
            ),
          ),
        );
      },
    );
  }
}
