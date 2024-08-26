import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_c11/my_bloc_observer.dart';
import 'package:movies_app_c11/screens/details/movies_details_screen.dart';
import 'package:movies_app_c11/screens/home_screen.dart';
import 'package:movies_app_c11/screens/splash/custom_splash_screen.dart';
import 'package:movies_app_c11/tabs/category_browse/category_browse/category_details/CategoryDetails.dart';
import 'package:movies_app_c11/theme/my_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  try {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyD47oYbl--p7qpKn4nfQ3qrp-mCKycwp6Q',
              appId: 'com.example.movies_app_c11',
              messagingSenderId: '110654541466',
              projectId: 'movies-app-c11'));
    } else {
      await Firebase.initializeApp();
    }
    // await FirebaseFirestore.instance.enableNetwork();
    runApp(const MyApp());
  } catch (e) {
    print(e);
  }
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
        MoviesDetailsScreen.routeName: (context) => MoviesDetailsScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        CategoryDetails.routeName: (context) =>  CategoryDetails()
      },
    );
  }
}
