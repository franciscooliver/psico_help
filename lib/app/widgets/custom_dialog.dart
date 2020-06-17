import 'package:flutter/material.dart';
import 'package:psico_help/app/core/constantes.dart';

class CustomDialog extends StatelessWidget {
  final String title, message, positiveBtnText, negativeBtnText;
  final bool showPositiveBtn;
  final Widget topChild;
  final isLoading;
  final Color color;
  final Function positiveBtnOnPressed;

  const CustomDialog(
      {Key key,
      @required this.title,
      @required this.message,
      @required this.positiveBtnText,
      this.negativeBtnText,
      this.showPositiveBtn,
      this.topChild,
      this.color,
      this.isLoading,
      this.positiveBtnOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.paddingALert),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      content: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.paddingALert,
            bottom: Consts.paddingALert,
            left: Consts.paddingALert,
            right: Consts.paddingALert,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: color ?? Theme.of(context).primaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.paddingALert),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Visibility(
                        visible: negativeBtnText != null,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(50)),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop(); // To close the dialog
                          },
                          child: Text(
                            negativeBtnText,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Visibility(
                        visible: showPositiveBtn == true,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(50)),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop(); // To close the dialog
                          },
                          child: Text(
                            positiveBtnText,
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Top image
        Visibility(
          visible: topChild != null,
          child: Positioned(
            left: Consts.paddingALert,
            right: Consts.paddingALert,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: Consts.avatarRadius,
              child: topChild,
            ),
          ),
        ),
      ],
    );
  }
}
