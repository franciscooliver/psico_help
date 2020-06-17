import 'package:flutter/material.dart';
import 'package:psico_help/app/core/constantes.dart';

class DetailsContent extends StatefulWidget {
  final child;
  final content;

  const DetailsContent({Key key, this.content, this.child}) : super(key: key);

  @override
  _DetailsContentState createState() => _DetailsContentState();
}

class _DetailsContentState extends State<DetailsContent> {
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(body: _body(width: width, height: height));
  }

  Widget _body({width, height}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Consts.start, Consts.end]),
      ),
      height: height,
      width: width,
      child: LayoutBuilder(
        builder: (_, constraints) => Column(
          children: <Widget>[
            SizedBox(
              height: constraints.maxHeight * .15,
              width: constraints.maxWidth,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20.0,
                          color: Colors.white,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
            ),
            Container(
              height: constraints.maxHeight * .84,
              width: constraints.maxWidth,
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xfff5f2fa),
              ),
              child: widget.child,
            )
          ],
        ),
      ),
    );
  }
}
