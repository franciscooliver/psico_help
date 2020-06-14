import 'package:flutter/material.dart';
import 'package:psico_help/app/core/constantes.dart';
import 'package:psico_help/app/core/enums/type_fields_enums.dart';
import 'package:psico_help/app/widgets/form_custom.dart';

class CreateContent extends StatelessWidget {
  double width, height;
  GlobalKey<FormState> _fkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController shortDescription = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  dynamic _validator(val) {
    if (val == "") return "Campo não pode está vazio";
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Consts.end,
          elevation: 3.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18.0,),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: _body());
  }

  Widget _body() {
    validator(val) {
      if (val == "") return "Campo obrigatório";
    }

    FormCustom formCustomName = FormCustom(
      hintText: "Seu nome(Opcional)",
      controller: nameController,
      validator: validator,
      margin: EdgeInsets.only(bottom: 15.0,),
      borderRadius: 5.0
    );

    FormCustom formCustomDescription = FormCustom(
      hintText: "Uma breve descrição",
      validator: validator,
      controller: shortDescription,
      margin: EdgeInsets.only(bottom: 15.0),
    );

    FormCustom formCustomContent = FormCustom(
      hintText: "Todo seu conteúdo",
      validator: _validator,
      controller: contentController,
      margin: EdgeInsets.only(bottom: 15.0),
    );

    FormCustom formCustomAge = FormCustom(
      hintText: "Informe sua idade(Opcional)",
      controller: ageController,
      margin: EdgeInsets.only(bottom: 15.0),
    );

    return Container(
      padding: const EdgeInsets.all(15.0),
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Consts.start, Consts.end]),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _fkey,
          child: Column(
            children: <Widget>[
              formCustomName.formFieldBuilder(
                  type: TypeFields.Text, obscure: false),
              // formCustomDescription.formFieldBuilder(type: TypeFields.Text, obscure: false),
            ],
          ),
        ),
      ),
    );
  }
}
