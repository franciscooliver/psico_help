import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:psico_help/app/controllers/content_controller.dart';
import 'package:psico_help/app/core/constantes.dart';
import 'package:psico_help/app/core/interfaces/auth_repository.dart';
import 'package:psico_help/app/core/interfaces/preferences_repository.dart';
import 'package:psico_help/app/model/content.model.dart';
import 'package:psico_help/app/model/testimony.model.dart';
import 'package:psico_help/app/modules/home/widgets/child_content_details_tips.dart';

import 'package:psico_help/app/widgets/card.dart';
import 'package:psico_help/app/modules/home/widgets/options.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ModularState<Home, ContentController> {
  Option _selectedChoice = options[0];
  
  @override
  void initState() {
    super.initState();

    Modular.get<IPreferences>()
        .getBool('IS_ADMIN')
        .then((value) => print(value.object));
  }

  void _select(Option choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
      print(_selectedChoice.title);
    });
  }

  double sizeWidth;
  double sizeHeight;

  @override
  Widget build(BuildContext context) {
    sizeWidth = MediaQuery.of(context).size.width;
    sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 3.0,
          backgroundColor: Consts.end,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20.0,
            ),
            onPressed: () {
              _select(options[0]);
            },
          ),
          title: Text(
            'Assuntos',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            PopupMenuButton<Option>(
                color: Colors.white,
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 25.0,
                ),
                itemBuilder: (context) {
                  return options
                      .map(
                        (option) => PopupMenuItem<Option>(
                          child: GestureDetector(
                            onTap: () async {
                              await Modular.get<IAuthRepository>().logOut();
                              await Modular.get<IPreferences>().clear();
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    option.icon,
                                    color: Colors.grey,
                                  ),
                                  Text(option.title)
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList();
                })
          ],
        ),
        body: _body());
  }

  onTapCard({Content content, Testimony testimony}) {
    // Navigator.to.pushNamed('/content/details', ar);
    List<dynamic> dataArgs = [
      ChildContentDetailsTips(content: content ?? null,),
      content
    ];
    Modular.to.pushNamed('/content/details', arguments: dataArgs);
  }


  _body() {
    return Container(
      height: sizeHeight,
      width: sizeWidth,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Consts.start, Consts.end])),
      padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.033),
      // color: Color(0xfff4f4f4),
      child: Observer(builder: (_) {
        List<Content> list = controller.contentList.data;

        if (controller.contentList.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              Content content = list[index];
              return CustomCard(
                image: NetworkImage(
                  'https://abrilguiadoestudante.files.wordpress.com/2020/03/posso-atuar-como-psicocc81loga-tendo-socc81-pocc81s-em-psicologia.jpg',
                ),
                title: content.title,
                description: content.shortDescription,
                index: index,
                isThreeLine: true,
                showRating: true,
                content: content,
                onTapCard: onTapCard,
              );
            });
      }),
    );
  }
}
