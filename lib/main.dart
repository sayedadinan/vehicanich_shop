import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/bottom_nav_blocs/bloc/bottom_nav_bloc.dart';
import 'package:vehicanich_shop/blocs/current_status_/bloc/current_status_bloc.dart';
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
import 'package:vehicanich_shop/firebase_options.dart';
import 'package:vehicanich_shop/screens/splash_screen/splash_screen.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => OnboardingBloc()),
    BlocProvider(create: (context) => LoginBloc()),
    BlocProvider(create: (context) => LocationBLoc()),
    BlocProvider(create: (context) => StartingTimeBloc()),
    BlocProvider(create: (context) => ClosingtimeBloc()),
    BlocProvider(create: (context) => ImageBloc()),
    BlocProvider(create: (context) => BodyBloc()),
    BlocProvider(create: (context) => InteriorBloc()),
    BlocProvider(create: (context) => EngineBloc()),
    BlocProvider(create: (context) => EmergencyBloc()),
    BlocProvider(create: (context) => RegistrationBloc()),
    BlocProvider(create: (context) => CurrentStatusBloc()),
    BlocProvider(create: (context) => BottomNavigationBloc()),
    BlocProvider(create: (context) => UserProfileBloc()),
    BlocProvider(create: (context) => BodyServiceUpdationBloc()),
    BlocProvider(create: (context) => InteriorServiceUpdationBloc()),
    BlocProvider(create: (context) => EngineServiceUpdationBloc()),
    BlocProvider(create: (context) => StartingTimeUpdationBloc()),
    BlocProvider(create: (context) => ClosingUpdationBloc()),
    BlocProvider(create: (context) => ImageUpdationBloc()),
    BlocProvider(create: (context) => TotalBillBloc()),
    BlocProvider(create: (context) => RevenueBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Appallcolor().buttonforgroundcolor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

// project_name/
// ├── android/
// ├── ios/
// ├── lib/
// │   ├── blocs/
// │   │   ├── authentication/
// │   │   │   ├── authentication_bloc.dart
// │   │   │   └── authentication_event.dart
// │   │   ├── data/
// │   │   │   ├── data_bloc.dart
// │   │   │   └── data_event.dart
// │   │   └── ...
// │   ├── models/
// │   │   ├── user.dart
// │   │   └── ...
// │   ├── repositories/
// │   │   ├── authentication_repository.dart
// │   │   └── data_repository.dart
// │   ├── screens/
// │   │   ├── login_screen.dart
// │   │   ├── home_screen.dart
// │   │   └── ...
// │   ├── services/
// │   │   ├── firebase_auth_service.dart
// │   │   ├── firebase_firestore_service.dart
// │   │   └── ...
// │   ├── utils/
// │   │   ├── firebase_utils.dart
// │   │   └── ...
// │   ├── widgets/
// │   │   ├── common_widget1.dart
// │   │   ├── common_widget2.dart
// │   │   └── ...
// │   ├── app.dart
// │   ├── main.dart
// ├── test/
// ├── pubspec.yaml
// ├── README.md
// └── ...
