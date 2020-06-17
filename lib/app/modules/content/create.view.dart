import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:psico_help/app/controllers/content_controller.dart';
import 'package:psico_help/app/core/constantes.dart';
import 'package:psico_help/app/core/enums/type_fields_enums.dart';
import 'package:psico_help/app/core/interfaces/preferences_repository.dart';
import 'package:psico_help/app/model/testimony.model.dart';
import 'package:psico_help/app/widgets/button.dart';
import 'package:psico_help/app/widgets/custom_dialog.dart';
import 'package:psico_help/app/widgets/form_custom.dart';
import 'package:psico_help/app/core/enums/app_enum.dart';


class CreateContent extends StatefulWidget {
  @override
  _CreateContentState createState() => _CreateContentState();
}

class _CreateContentState extends State<CreateContent> {
  double width, height;
  TextEditingController ageController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  GlobalKey<FormState> _fkey = GlobalKey<FormState>();

  

  Widget _body() {
    validator(String val) {
      if (val == "") return "Campo obrigatório";
    }

    contentValidator(String val) {
      if (val == "") {
        return "Campo obrigatório";
      }

      if(val.length < 10) return "Escreva ao menos 150 careacteres";
    }

    FormCustom formCustomName = FormCustom(
      hintText: "Seu nome(Opcional)",
      controller: nameController,
      margin: EdgeInsets.only(bottom: 15.0,),
      borderRadius: 5.0
    );

    FormCustom formCustomAge = FormCustom(
      hintText: "Informe sua idade(Opcional)",
      controller: ageController,
      borderRadius: 5.0,
      inputType: TextInputType.number,
      margin: EdgeInsets.only(bottom: 15.0),
    );

    FormCustom formCustomContent = FormCustom(
      hintText: "Todo seu conteúdo",
      validator: contentValidator,
      controller: contentController,
      borderRadius: 5.0,
      minLines: 10,
      margin: EdgeInsets.only(bottom: 15.0),
    );


    return Container(
      padding: const EdgeInsets.only(top: 15.0, right: 15.0, left: 15.0),
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
              Text("Faça como outras pessoas e compartilhe também como está fazendo para passar"+
              "por esse momento difícil de pandemia. Não se preocupe, não precisa se identificar se não quiser!",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                height: 1.3,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(1.0, 0.0))]
              ),),
              SizedBox(height: 10.0,),
              formCustomName.formFieldBuilder(type: TypeFields.Text, obscure: false),
              formCustomAge.formFieldBuilder(type: TypeFields.Text, obscure: false),
              formCustomContent.formFieldBuilder(type: TypeFields.Multiline, obscure: false),
              CustomButtom(
                maxWidth: width,
                maxHeight: height,
                height: height * .09,
                buttonText: Consts.contentCreateButtonText,
                bgColor: Consts.end,
                marginBottom: 14.0,
                onPressed: _sendTestimony,
                isLoading: isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sendTestimony() async {
    setState(() {
      isLoading = true;
    });
    
    if(this._fkey.currentState.validate()){
      Testimony testimony = new Testimony();
      var _userId =  await Modular.get<IPreferences>()
        .getUser();

      print('UserId: '+_userId.object);
      print(date);
      
      testimony.name = this.nameController.text;
      testimony.age =  int.parse(this.ageController.text);
      testimony.body = this.contentController.text;
      testimony.testimonyDate = date;
      testimony.userId = _userId.object;
      testimony.active = false;

      var statusRes = await Modular.get<ContentController>().setTestimony(testimony);
      Future.delayed(Duration(microseconds: 2000), () {
        _showAlert(statusRes: statusRes);
        setState(() {
          isLoading = false;
        });
      });

    }
  }

  String get date{
    String day =  DateTime.now().day.toString();
    String month = DateTime.now().month > 9 ? DateTime.now().month.toString() :  '0${DateTime.now().month}';
    String year = DateTime.now().year.toString();
    String date = '$day/$month/$year';

    return date;
  }

  _showAlert({statusRes}){
    showDialog(
        context: context,
        child: CustomDialog(
          title:  statusRes == ResponseStatus.Success ? "Sucesso" : "Erro no envio",
          message: statusRes == ResponseStatus.Success 
            ? 'Obrigado por compartilhar seu depoimento de quarentena, seu conteúdo foi enviado e assim que for aprovado, aparecerá na lista de depoimentos.'
            : 'Infelizmente houve um erro ao tentar enviar seu depoimento, tente novamente.',
          showPositiveBtn: true,
          positiveBtnText: "Depoimentos",
          negativeBtnText: "Fechar",
          color: statusRes == ResponseStatus.Success
            ? Consts.end
            : Colors.redAccent
        ));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Consts.end,
          elevation: 3.0,
          title: Text('Publicar depoimento', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18.0,),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: _body());
  }
}
