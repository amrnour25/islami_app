import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);
  static const String splashRoute="SplashScreen";

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> HomeScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/splash_background.png"))
        ),
      ),
    );
  }
}
