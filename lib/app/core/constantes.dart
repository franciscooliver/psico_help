import 'package:flutter/material.dart';

class Consts {
  Consts._();

  // Background of pages
  // background-image: linear-gradient(120deg, #89f7fe 0%, #66a6ff 100%);
  static Color start = Color(0xff89f7fe);
  static Color end = Color(0xff66a6ff);

  static Color primarColor = start;


  // Textos
  static String loginText = "Entrar";
  static String loginGoogleText = "Entrar com o Google";
  static String signupButtonText = "Salvar";
  static double paddingALert = 16.0;
  static double avatarRadius = 30.0;

  // Keys SharedPreferences
  static String isADMIN = "IS_ADMIN";
}
