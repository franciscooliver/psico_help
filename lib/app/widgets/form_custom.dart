import 'package:flutter/material.dart';
import 'package:psico_help/app/core/constantes.dart';
import 'package:psico_help/app/core/enums/type_fields_enums.dart';
import 'package:psico_help/app/modules/login/interfaces/form_interface.dart';

class FormCustom implements IFormField {
  final hintText;
  final Function validator;
  final EdgeInsets margin;
  final double padding;
  final borderRadius;
  final controller;

  FormCustom(
      {this.hintText,
      @required this.validator,
      this.margin,
      this.padding,
      this.controller,
      this.borderRadius});

  fieldText({Function validator, String hintText, bool obscure}) {
    return TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 17.5),
          errorStyle: TextStyle(height: 0.2, fontSize: 15.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Consts.end, width: 2.0),
            borderRadius: BorderRadius.circular(borderRadius != null ? borderRadius : 25.7),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(borderRadius != null ? borderRadius : 25.7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(borderRadius != null ? borderRadius : 25.7),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
            borderRadius: BorderRadius.circular(borderRadius != null ? borderRadius : 25.7),
          ),
          
          hintStyle: TextStyle(color: const Color(0xff99a2b3)),
          hintText: hintText,
        ),
        validator: validator,
        obscureText: obscure,
        controller: controller ?? controller);
  }

  @override
  Widget formFieldBuilder({TypeFields type, bool obscure}) {
    final Map<TypeFields, dynamic> fields = {};

    fields[TypeFields.Text] =
        fieldText(validator: validator, hintText: hintText, obscure: obscure);

    return Container(
      margin: margin,
      child: fields[type],
    );
  }
}
