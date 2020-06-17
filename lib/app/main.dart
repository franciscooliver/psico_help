import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:psico_help/app/app_module.dart';
import 'package:shared_preferences/shared_preferences.dart';




void main() async {
  runApp(ModularApp(module: AppModule()));
}

// Future setupPreferences() async{
//   final preferences = await SharedPreferences.getInstance();
//   var userId = preferences.getString('ID');
//   print('MAIN USERID: $userId');
//   await preferences.setString('ID', userId);
//   // SharedPreferences.setMockInitialValues({});
//   SharedPreferences.setMockInitialValues(<String, dynamic>{'ID': userId});
// }


