import 'package:flutter/material.dart';
import 'package:psico_help/app/core/constantes.dart';

class CustomButtom extends StatelessWidget {
  final sizeWidth;
  final sizeHeight;
  final maxHeight;
  final maxWidth;
  final height;
  final buttonText;
  final isLoading;
  final Function onPressed;
  final Color bgColor;

  const CustomButtom(
      {Key key,
      this.sizeWidth,
      this.sizeHeight,
      this.maxHeight,
      this.maxWidth,
      this.height,
      @required this.buttonText,
      this.onPressed,
      this.bgColor,
      this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: maxWidth,
      margin: const EdgeInsets.only(top: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 25.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              5.0, // Move to right 10  horizontally
              5.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      // padding: EdgeInsets.symmetric(horizontal: maxWidth * .0700),
      child: RaisedButton(
          child: Visibility(
            replacement: Text(buttonText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
            visible: isLoading == true,
            child: Center(
              child: Container(
                height: 25.0,
                width: 25.0,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 2.0,
                ),
              ),
            ),
          ),
          color: bgColor != null ? bgColor : Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(27.5)),
          onPressed: this.onPressed != null ? this.onPressed : null),
    );
  }
}
