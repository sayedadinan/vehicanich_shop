import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/closingtime_blocs/bloc/closingtime_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/image_blocs/image_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/registration_button_bloc/bloc/registration_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/body_service/service_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/engine_bloc/bloc/engine_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/interior_service/bloc/interior_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/startingtime_bloc.dart/bloc/time_bloc.dart';

locationvalidation(context) {
  return BlocProvider.of<LocationBLoc>(context).state.address.isNotEmpty;
}

startingtimevalidation(context) {
  return BlocProvider.of<StartingTimeBloc>(context)
      .state
      .startingTime
      .isNotEmpty;
}

closingtimevalidation(context) {
  return BlocProvider.of<ClosingtimeBloc>(context).state.closingTime.isNotEmpty;
}

licenceimagevalidation(context) {
  return BlocProvider.of<ImageBloc>(context).state.licenceimagepath.isNotEmpty;
}

bannerphotovalidation(context) {
  return BlocProvider.of<ImageBloc>(context).state.bannerimagepath.isNotEmpty;
}

bodyvalidation(context) {
  return BlocProvider.of<BodyBloc>(context).state.newmpty.isNotEmpty;
}

interiorvalidation(context) {
  return BlocProvider.of<InteriorBloc>(context).state.newmpty.isNotEmpty ||
      BlocProvider.of<BodyBloc>(context).state.servicesList.isNotEmpty ||
      BlocProvider.of<EngineBloc>(context).state.newmpty.isNotEmpty;
}

enginevalidation(context) {
  return BlocProvider.of<EngineBloc>(context).state.newmpty.isNotEmpty;
}

buttonpressedornot(context) {
  BlocProvider.of<RegistrationBloc>(context).state.buttonpressed;
}

serviceValidation(context) {}
