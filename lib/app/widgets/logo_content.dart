import 'package:flutter/material.dart';
import 'package:psico_help/app/core/constantes.dart';

class LogoContent extends StatelessWidget {
  final sizeWidth;
  final sizeHeight;
  final maxHeight;
  final maxWidth;

  const LogoContent({Key key, this.sizeWidth, this.sizeHeight, this.maxHeight, this.maxWidth}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxHeight,
      width: sizeWidth,
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.center,
        width: sizeWidth * .4,
        height: sizeHeight * .2,
        decoration: BoxDecoration(
            color: Consts.start,
            borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          "F",
          style: TextStyle(fontSize: 100.0, color: Colors.white),
        ),
      ),
    );
  }
}
