import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app_c11/screens/home_screen.dart';
import 'package:movies_app_c11/theme/app_colors.dart';

class CustomSplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  const CustomSplashScreen({super.key});

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      _goToWelcomePage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(child: Image.asset('assets/images/splash_screen_icon.png')),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/splash_screen_branding.png'),
            ),
          )
        ],
      ),
    );
  }

  void _goToWelcomePage() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }
}
