import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/firebase_options.dart';
import 'package:vehicanich_shop/screens/splash_screen/splash_screen.dart';
import 'package:vehicanich_shop/utils/app_blocproviders.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: buildBlocProviders(),
      child: const MyApp(),
    ),
  );
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
