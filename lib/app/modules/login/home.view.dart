import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:psico_help/app/controllers/user_controller.dart';
import 'package:psico_help/app/core/constantes.dart';
import 'package:psico_help/app/core/enums/app_enum.dart';
import 'package:psico_help/app/core/enums/type_fields_enums.dart';
import 'package:psico_help/app/core/interfaces/auth_repository.dart';
import 'package:psico_help/app/core/interfaces/preferences_repository.dart';
import 'package:psico_help/app/modules/login/components/login.component.dart';
import 'package:psico_help/app/modules/login/text_fields.dart';
import 'package:psico_help/app/widgets/CustomDialog.dart';
import 'package:psico_help/app/widgets/form_custom.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with LoginComponent {
  final GlobalKey<FormState> _fkey = GlobalKey<FormState>();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  String name = "Default";
  bool isLoadingBtnLogin = false;
  bool isLoadingBtnLoginG = false;

  final listFields = fields;
  double sizeWidth;
  double sizeHeight;

  @override
  Widget build(BuildContext context) {
    sizeHeight = MediaQuery.of(context).size.height;
    sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(body: _body());
  }

  Widget _body() {
    validator(val) {
      if (val == "") return "Campo obrigatório";
    }

    FormCustom formFieldEmail = FormCustom(
        hintText: "Seu email",
        margin: EdgeInsets.only(bottom: 15.0),
        validator: validator,
        controller: emailCtrl);

    FormCustom formFieldPassword = FormCustom(
        hintText: "Sua senha",
        margin: EdgeInsets.only(bottom: 15.0),
        validator: validator,
        controller: passCtrl);

    List<Widget> fields = [
      formFieldEmail.formFieldBuilder(type: TypeFields.Text, obscure: false),
      formFieldPassword.formFieldBuilder(type: TypeFields.Text, obscure: true),
    ];

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
                  logo(
                      maxWidth: maxWidth,
                      maxHeight: maxHeight,
                      sizeWidth: sizeWidth,
                      sizeHeight: sizeHeight),
                  textBottomLogo(constraints: constraints),
                  form(
                      maxWidth: maxWidth,
                      maxHeight: maxHeight,
                      sizeHeight: sizeHeight,
                      fkey: _fkey,
                      fields: fields,
                      btnLoginFunction: _login,
                      btnLoginGoogleFunction: _googleLogin,
                      isLoadingLogin: isLoadingBtnLogin,
                      isLoadingLoginG: isLoadingBtnLoginG),
                  footer(context: context, maxHeight: maxHeight)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  _login() async {
    setState(() {
      isLoadingBtnLogin = true;
    });

    if (this._fkey.currentState.validate()) {
      String credentials = passCtrl.text.trim();
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String passEconded = stringToBase64.encode(credentials);

      // Fazendo login com usuário comum
      bool res = await Modular.get<UserController>()
          .doLoginEmailPassword(emailCtrl.text.trim(), passEconded);

      if (res) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, '/');
        });
      } else {
        setState(() {
          isLoadingBtnLogin = false;
        });

        _showAlert();
      }
      // controller.doLoginEmailPassword(emailCtrl.text.trim(), passCtrl.text.trim());
    } else {
      setState(() {
        isLoadingBtnLogin = false;
      });
    }
  }

  void _showAlert() {
    showDialog(
        context: context,
        child: CustomDialog(
          title: "Erro login",
          message:
              "Não foi possível realizar o login, verifique os dados digitados.",
          showPositiveBtn: false,
          positiveBtnText: "",
          negativeBtnText: "Fechar",
          color: Colors.redAccent
        ));
  }

  _googleLogin() async {
    // Fazendo login com usuário Google
    await Modular.get<IAuthRepository>().doLoginGoogle().then((res) => {
          if (res.status == ResponseStatus.Success)
            {
              print(res.object),
              Modular.get<IPreferences>().setUser('ID', res.object.uid).then(
                  (value) => {
                        value.object ? Navigator.pushNamed(context, '/') : null,
                        _setStatusAdmin()
                      })
            }
          else
            {print(res.message)}
        });
  }

  _setStatusAdmin() {
    Modular.get<IPreferences>().setBool('IS_ADMIN', false);
  }
}
