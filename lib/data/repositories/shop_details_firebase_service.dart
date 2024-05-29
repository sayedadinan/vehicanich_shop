// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/closingtime_blocs/bloc/closingtime_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/body_service/service_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/engine_bloc/bloc/engine_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/interior_service/bloc/interior_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/startingtime_bloc.dart/bloc/time_bloc.dart';
import 'package:vehicanich_shop/data/models/shop_model.dart';
import 'package:vehicanich_shop/data/data_provider/shop_reference.dart';
import 'package:vehicanich_shop/data/services/image_changing.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';

class ShopDetailsFirebaseService {
  Future<void> addShopDetailsToFirebase(BuildContext context) async {
    //data adding to Database from here
    try {
      final licenceImageUrl =
          await ImageChanging().licenceImageChanging(context);
      final mmImageUrl = await ImageChanging().mmImageChanging(context);
      final bannerImageUrl = await ImageChanging().bannerImageChanging(context);
      final shopDetails = ShopModel(
        locationaddress: BlocProvider.of<LocationBLoc>(context).state.address,
        isRejected: false,
        phone: phonecontroller.text.trim().toString(),
        isApproved: false,
        name: namecontroller.text.trim(),
        email: emailcontroller.text.trim(),
        whatsapp: whatsappcontroller.text.toString(),
        password: passwordcontroller.text.trim(),
        shopname: shopnamecontroller.text.trim(),
        shoplocation: GeoPoint(
            BlocProvider.of<LocationBLoc>(context).state.latLng.latitude,
            BlocProvider.of<LocationBLoc>(context).state.latLng.longitude),
        description: descriptioncontroller.text.trim(),
        startingtime:
            BlocProvider.of<StartingTimeBloc>(context).state.startingTime,
        closingtime:
            BlocProvider.of<ClosingtimeBloc>(context).state.closingTime,
        licenceimagepath: licenceImageUrl,
        mmimagepath: mmImageUrl,
        bannerimagepath: bannerImageUrl,
        bodyservicemap: BlocProvider.of<BodyBloc>(context).state.servicesList,
        interiorservicemap:
            BlocProvider.of<InteriorBloc>(context).state.servicesList,
        enginservicemap:
            BlocProvider.of<EngineBloc>(context).state.servicesList,
      );
      //this is the funtion for adding to firebase
      await ShopreferenceId()
          .shopCollectionReference()
          .add(shopDetails.toJson());
    } catch (error) {
      print("Error adding shop details: $error");
    }
  }
}
