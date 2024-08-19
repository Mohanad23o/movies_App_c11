import 'package:flutter/material.dart';
import 'package:movies_app_c11/screens/home_screen.dart';
import 'package:movies_app_c11/screens/splash/custom_splash_screen.dart';
import 'package:movies_app_c11/theme/my_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData.lightMode,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: CustomSplashScreen.routeName,
      routes: {
        CustomSplashScreen.routeName: (context) => const CustomSplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen()
      },
    );
  }
}
