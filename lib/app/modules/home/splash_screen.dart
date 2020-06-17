import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CustomSplashScreen extends StatefulWidget {
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 8),
        () => Navigator.pushReplacementNamed(context, '/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 500,
            height: 400,
            child: FlareActor(
              'assets/animations/splash.flr',
              alignment: Alignment.center,
              animation: 'pulseAndShowText',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 70.0,
            child: LinearProgressIndicator(),
          )
        ],
      ),
    );
  }
}
