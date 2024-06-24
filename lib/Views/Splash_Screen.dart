import 'package:flutter/material.dart';

import 'HomeScreen/home_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DohaApp(),));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          width: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splash.gif'),
            ),
          ),
        ),
      ),
    );
  }
}
