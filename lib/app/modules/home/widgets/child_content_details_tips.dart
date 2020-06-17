import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:psico_help/app/model/content.model.dart';

class ChildContentDetailsTips extends StatelessWidget {
  final Content content;

  const ChildContentDetailsTips({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            content != null ? content.title  : "",
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 15.0,
          ),
          // Para colocar ponto antes do texto \u2022
          RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w300,),
                children: [
                  TextSpan(
                      text: '1', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' - selecione um lugar tranquilo e silencioso')
                ]),
          ),
          SizedBox(height: 15.0,),
          RichText(
            text: TextSpan(
                text: '2',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      style: TextStyle(fontWeight: FontWeight.w300),
                      text: ' - Sente-se confortavelmente em uma posição com a coluna ereta')
                ]),
          ),
          SizedBox(height: 15.0,),
          RichText(
            strutStyle: StrutStyle(),
            text: TextSpan(
                text: '3',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    style: TextStyle(fontWeight: FontWeight.w300),
                    text: ' - Se preferir coloque sons de natureza ou mantras , (o mais conhecido é o OM), ou permaneça em silêncio. ',
                  )
                ]),
          ),
          SizedBox(height: 15.0,),
          RichText(
            strutStyle: StrutStyle(),
            text: TextSpan(
                text: '4',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                     style: TextStyle(fontWeight: FontWeight.w300),
                      text: ' - Feche os olhos e esvazie a sua mente (tente pensar em cores claras , isso facilita, como branco , ou azul claro)')
                ]),
          ),
          SizedBox(height: 15.0,),
          RichText(
            strutStyle: StrutStyle(),
            text: TextSpan(
                text: '5',
                style: TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    style: TextStyle(fontWeight: FontWeight.w300),
                      text:' - Comece respirando fundo e conte de 4 a 5r segundo e solte , repita o processo pelo menos umas 9x .')
                ]),
          ),
          SizedBox(height: 15.0,),
          RichText(
            strutStyle: StrutStyle(),
            text: TextSpan(
                 text: '6',
                style: TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ' - Permaneça por pelo menos 30 min.',
                    style: TextStyle(fontWeight: FontWeight.w300),)
                ]),
          ),
        ],
      ),
    );
  }
}
