import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:abu_rizolve/views/signuplogin/SignInOption.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SignInOption(bgImage))));
  }

  final bgImage = AssetImage("assets/SignInOptionsImage.jpg");

  @override
  void didChangeDependencies() {
    precacheImage(bgImage, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ABU Rizolve",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: "FredokaOne",
                //fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Submit And Manage Your Complaints",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
                fontFamily: "Playball"),
          )
        ],
      )),
    );
  }
}
