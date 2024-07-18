import 'dart:async';
import 'package:alumini_final/auth/authenthication.dart';
import 'package:alumini_final/auth/login.dart';

import 'package:alumini_final/colors.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<StatefulWidget> {
  @override
  void initState() {
    super.initState();
    StartTimer();
  }

  StartTimer() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => Authentication( admincheck: emailcontroller.text.trim(),))));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Center(
        child: Image(
          image: AssetImage('assets/Alumini_logo.png'),
        ),
      ),
    );
  }
}
