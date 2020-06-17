import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final minLines;
  final TextInputType inputType;

  FormCustom(
      {this.hintText,
      @required this.validator,
      this.margin,
      this.padding,
      this.controller,
      this.borderRadius,
      this.minLines,
      this.inputType});

  fieldText({Function validator, String hintText, bool obscure,}) {
    return TextFormField(
        keyboardType: inputType ?? TextInputType.text,
        inputFormatters: inputType == TextInputType.number ? [WhitelistingTextInputFormatter.digitsOnly] : null,
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
        controller: controller ?? controller
        );
  }


  multilinesFieldText({Function validator, String hintText}){
    return TextFormField(
        minLines: minLines ?? 3,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 17.5),
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
        controller: controller ?? controller);
  }
  @override
  Widget formFieldBuilder({TypeFields type, bool obscure}) {
    final Map<TypeFields, dynamic> fields = {};

    fields[TypeFields.Text] =
        fieldText(validator: validator, hintText: hintText, obscure: obscure);

    fields[TypeFields.Multiline] =
        multilinesFieldText(validator: validator, hintText: hintText);

    return Container(
      margin: margin,
      child: fields[type],
    );
  }
}
