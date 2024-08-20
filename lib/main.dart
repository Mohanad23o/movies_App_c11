import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_c11/my_bloc_observer.dart';
import 'package:movies_app_c11/screens/home_screen.dart';
import 'package:movies_app_c11/screens/splash/custom_splash_screen.dart';
import 'package:movies_app_c11/theme/my_theme_data.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.lightMode,
      debugShowCheckedModeBanner: false,
      initialRoute: CustomSplashScreen.routeName,
      routes: {
        CustomSplashScreen.routeName: (context) => const CustomSplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen()
      },
    );
  }
}
