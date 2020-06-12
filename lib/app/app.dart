//  app_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:psico_help/app/core/constantes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'PsicoHelp',
      theme: ThemeData(
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          primaryColor: Consts.primarColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Nunito"),
      // set your initial route
      initialRoute: "/",
      // add Modular to manage the routing system
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
