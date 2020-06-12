import 'package:flutter/material.dart';

List<Widget> fields = [
  Container(
    margin: const EdgeInsets.only(bottom: 15.0),
    child: TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.green, width: 1.5),
        ),
        border: OutlineInputBorder(
          gapPadding: 10.0,
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: const Color(0xffe1e1e1)),
        ),
        hintStyle: TextStyle(color: const Color(0xff99a2b3)),
        hintText: 'Sua senha',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    ),
  ),
  Container(
    child: TextFormField(
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.green, width: 1.5),
          ),
          border: OutlineInputBorder(
            gapPadding: 10.0,
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: const Color(0xffe1e1e1)),
          ),
          hintStyle: TextStyle(color: const Color(0xff99a2b3)),
          hintText: 'Seu email'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    ),
  )
];
