import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/closingtime_blocs/bloc/closingtime_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/body_service/service_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/engine_bloc/bloc/engine_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/interior_service/bloc/interior_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/startingtime_bloc.dart/bloc/time_bloc.dart';
import 'package:vehicanich_shop/models/shop_model.dart';
import 'package:vehicanich_shop/services/image_changing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';

class FirebaseDatastoring {
  final CollectionReference reference =
      FirebaseFirestore.instance.collection('shop_details');
  addShopDetailsToFirebase(BuildContext context) async {
    try {
      final licenceimagereferenceUrl =
          await Imagechanging().licenceimagechanging(context);
      final mmimagereferenceUrl =
          await Imagechanging().licenceimagechanging(context);
      final bannerimagereferenceUrl =
          await Imagechanging().licenceimagechanging(context);
      final shopDetails = ShopModel(
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
        licenceimagepath: licenceimagereferenceUrl,
        mmimagepath: mmimagereferenceUrl,
        bannerimagepath: bannerimagereferenceUrl,
        bodyservicemap: BlocProvider.of<BodyBloc>(context).state.serviceNamemap,
        interiorservicemap:
            BlocProvider.of<InteriorBloc>(context).state.serviceNamemap,
        enginservicemap:
            BlocProvider.of<EngineBloc>(context).state.serviceNamemap,
      );
      // Map<String, dynamic> shopData = shopDetails.toJson();
      await reference.add(shopDetails.toJson());
    } catch (error) {
      print("Error adding shop details: $error");
    }
  }
}
