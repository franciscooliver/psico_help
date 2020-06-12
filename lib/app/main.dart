import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:psico_help/app/app_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  runApp(ModularApp(module: AppModule()));
}


