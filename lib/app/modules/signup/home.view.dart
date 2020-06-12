import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:psico_help/app/core/constantes.dart';
import 'package:psico_help/app/core/enums/app_enum.dart';
import 'package:psico_help/app/core/enums/type_fields_enums.dart';
import 'package:psico_help/app/core/interfaces/user_repository.dart';
import 'package:psico_help/app/model/user.model.dart';
import 'package:psico_help/app/modules/login/text_fields.dart';
import 'package:psico_help/app/widgets/CustomDialog.dart';
import 'package:psico_help/app/widgets/button.dart';
import 'package:psico_help/app/widgets/form_custom.dart';
import 'package:psico_help/app/widgets/logo_content.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _fkey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  bool isLoading = false;
  final listFields = fields;
  double sizeWidth;
  double sizeHeight;

  @override
  Widget build(BuildContext context) {
    sizeHeight = MediaQuery.of(context).size.height;
    sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            splashColor: Colors.grey.shade100,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Consts.end,
          elevation: 0,
        ),
        body: _body());
  }

  Widget _body() {
    validator(val) {
      if (val == "") return "Campo obrigatório";
    }

    FormCustom formFieldName = FormCustom(
        hintText: "Seu nome",
        margin: EdgeInsets.only(bottom: 15.0),
        validator: validator,
        controller: nameCtrl);

    FormCustom formFieldEmail = FormCustom(
        hintText: "Seu email",
        margin: EdgeInsets.only(bottom: 15.0),
        validator: validator,
        controller: emailCtrl);

    FormCustom formFieldPassword = FormCustom(
        hintText: "Digite uma senha",
        margin: EdgeInsets.only(bottom: 15.0),
        validator: validator,
        controller: passCtrl);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Consts.start, Consts.end]),
      ),
      child: SizedBox(
        height: sizeHeight,
        child: LayoutBuilder(builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: sizeHeight * .8,
              ),
              child: Column(
                children: <Widget>[
                  LogoContent(
                    sizeWidth: sizeWidth,
                    sizeHeight: sizeHeight,
                    maxWidth: maxWidth,
                    maxHeight: 120.0,
                  ),
                  Container(
                    height: constraints.maxHeight * .1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            "Cadastre-se",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: const Color(0xff59474b),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: maxWidth * .0700),
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Form(
                        key: _fkey,
                        child: Column(
                          children: <Widget>[
                            formFieldName.formFieldBuilder(
                                type: TypeFields.Text, obscure: false),
                            formFieldEmail.formFieldBuilder(
                                type: TypeFields.Text, obscure: false),
                            formFieldPassword.formFieldBuilder(
                                type: TypeFields.Text, obscure: true),
                            CustomButtom(
                              maxWidth: maxWidth,
                              maxHeight: maxHeight,
                              height: sizeHeight * .1,
                              buttonText: Consts.signupButtonText,
                              bgColor: Consts.end,
                              isLoading: isLoading,
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                _submitUser();
                              },
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  _submitUser() {
    if (this._fkey.currentState.validate()) {
      User user = User();
      user.name = nameCtrl.text.trim();
      user.email = emailCtrl.text.trim();
      user.password = passCtrl.text.trim();
      user.isAdmin = false;

      Modular.get<IUser>().save(user).then((res) {
        if (res.object == ResponseStatus.Success) {
          Navigator.pushReplacementNamed(context, '/signin');
        } else {
          new CustomDialog(
            title: 'Erro cadastro',
            message: 'Erro ao cadastrar usuário',
            positiveBtnText: "",
            negativeBtnText: "Fechar",
          );
        }
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
}
