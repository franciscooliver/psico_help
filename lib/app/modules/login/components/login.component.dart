import 'package:flutter/material.dart';
import 'package:psico_help/app/core/constantes.dart';
import 'package:psico_help/app/widgets/button.dart';
import 'package:psico_help/app/widgets/logo_content.dart';

class LoginComponent {
  Widget logo({sizeWidth, sizeHeight, maxWidth, maxHeight}) {
    return LogoContent(
        sizeWidth: sizeWidth,
        sizeHeight: sizeHeight,
        maxWidth: maxWidth,
        maxHeight: sizeHeight * .250);
  }

  Widget textBottomLogo({constraints}) {
    return Container(
      height: constraints.maxHeight * .150,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              "Faça login para publicar seu tópico no PsicoHelp",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget form(
      {maxWidth,
      maxHeight,
      sizeHeight,
      fkey,
      List<Widget> fields,
      isLoadingLogin,
      isLoadingLoginG,
      Function btnLoginFunction,
      Function btnLoginGoogleFunction}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: maxWidth * .0700),
      child: Form(
          key: fkey,
          child: Column(
            children: <Widget>[
              fields[0],
              fields[1],
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Esqueceu a senha?",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16.0, height: 1),
                  ),
                ],
              ),
              CustomButtom(
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                height: sizeHeight * .09,
                buttonText: Consts.loginText,
                bgColor: Consts.end,
                onPressed: btnLoginFunction,
                isLoading: isLoadingLogin,
              ),
              CustomButtom(
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                height: sizeHeight * .09,
                bgColor: Colors.redAccent,
                buttonText: Consts.loginGoogleText,
                onPressed: btnLoginGoogleFunction,
                isLoading: isLoadingLoginG,
              ),
            ],
          )),
    );
  }

  footer({@required context, double maxHeight}) {
    return SizedBox(
      height: maxHeight * 0.060,
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Não tem conta? ",
                style: TextStyle(fontSize: 15.0),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 12.0,
                        color: Colors.blue,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                    fontSize: 15.0,
                    color: Consts.end,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
