import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/Screens/Splash/Controllers/splashcontroller.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      SplashController.checkuser(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Icon(Icons.newspaper,size: 80,color: Colors.blue,),),
    );
  }
}
