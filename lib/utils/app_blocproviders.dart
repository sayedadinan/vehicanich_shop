import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/bottom_nav_blocs/bloc/bottom_nav_bloc.dart';
import 'package:vehicanich_shop/blocs/current_status_/bloc/current_status_bloc.dart';
import 'package:vehicanich_shop/blocs/date_change_bloc/bloc/date_change_bloc.dart';
import 'package:vehicanich_shop/blocs/login_bloc/login_bloc.dart';
import 'package:vehicanich_shop/blocs/onboarding_bloc/onboarding_bloc.dart';
import 'package:vehicanich_shop/blocs/wallet/revenue_bloc/bloc/revenue_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/closingtime_blocs/bloc/closingtime_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/image_blocs/image_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/location_bloc/location_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/registration_button_bloc/bloc/registration_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/body_service/service_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/emergency_bloc/bloc/emergency_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/engine_bloc/bloc/engine_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/interior_service/bloc/interior_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/startingtime_bloc.dart/bloc/time_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/Interior_service_updation/bloc/interior_service_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/body_service_updation/bloc/body_service_updation_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/engine_service_updation/bloc/engine_service_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/time_updation_bloc/closing_time/closing_updation_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/time_updation_bloc/starting_time/starting_time_updation_bloc.dart';
import 'package:vehicanich_shop/blocs/wallet/total_bill_bloc/bloc/total_bill_bloc.dart';
import 'package:vehicanich_shop/blocs/user_profile_bloc/bloc/user_profile_bloc.dart';
import 'package:vehicanich_shop/blocs/user_profile_bloc/profile_image/bloc/image_updation_bloc.dart';

List<BlocProvider> buildBlocProviders() {
  return [
    BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
    BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
    BlocProvider<LocationBLoc>(create: (context) => LocationBLoc()),
    BlocProvider<StartingTimeBloc>(create: (context) => StartingTimeBloc()),
    BlocProvider<ClosingtimeBloc>(create: (context) => ClosingtimeBloc()),
    BlocProvider<ImageBloc>(create: (context) => ImageBloc()),
    BlocProvider<BodyBloc>(create: (context) => BodyBloc()),
    BlocProvider<InteriorBloc>(create: (context) => InteriorBloc()),
    BlocProvider<EngineBloc>(create: (context) => EngineBloc()),
    BlocProvider<EmergencyBloc>(create: (context) => EmergencyBloc()),
    BlocProvider<RegistrationBloc>(create: (context) => RegistrationBloc()),
    BlocProvider<CurrentStatusBloc>(create: (context) => CurrentStatusBloc()),
    BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc()),
    BlocProvider<UserProfileBloc>(create: (context) => UserProfileBloc()),
    BlocProvider<BodyServiceUpdationBloc>(
        create: (context) => BodyServiceUpdationBloc()),
    BlocProvider<InteriorServiceUpdationBloc>(
        create: (context) => InteriorServiceUpdationBloc()),
    BlocProvider<EngineServiceUpdationBloc>(
        create: (context) => EngineServiceUpdationBloc()),
    BlocProvider<StartingTimeUpdationBloc>(
        create: (context) => StartingTimeUpdationBloc()),
    BlocProvider<ClosingUpdationBloc>(
        create: (context) => ClosingUpdationBloc()),
    BlocProvider<ImageUpdationBloc>(create: (context) => ImageUpdationBloc()),
    BlocProvider<TotalBillBloc>(create: (context) => TotalBillBloc()),
    BlocProvider<RevenueBloc>(create: (context) => RevenueBloc()),
    BlocProvider<DateChangeBloc>(create: (context) => DateChangeBloc()),
  ];
}
