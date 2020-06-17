import 'package:flutter/material.dart';
import 'package:psico_help/app/model/testimony.model.dart';

class ChildTestimonysDetails extends StatelessWidget {
  final Testimony testimony;

  const ChildTestimonysDetails({Key key, this.testimony}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Usuário: ${testimony.name}"),
        Text("Idade: ${testimony.age}"),
      ],
    );
  }
}