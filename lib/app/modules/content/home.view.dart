import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:psico_help/app/controllers/content_controller.dart';
import 'package:psico_help/app/core/constantes.dart';
import 'package:psico_help/app/model/testimony.model.dart';
import 'package:psico_help/app/modules/content/components/component.dart';
import 'package:psico_help/app/widgets/card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ModularState<Home, ContentController> with Component {
  ScrollController _scrollController;
  Color _theme = Colors.transparent;
  bool isRounded;
  double width;
  double height;
  double top;

  @override
  void initState() {
    super.initState();
    top = 0.0;
    isRounded = true;
    _scrollController = ScrollController()
      ..addListener(
        () => _isAppBarExpanded
            ? setState(
                () {
                _theme = Consts.end;
                  isRounded = false;
                },
              )
            : setState(() {
                _theme = Colors.transparent;
                isRounded = true;
              }),
      );
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (180 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Container(
      height: height,
      width: width,
      decoration: decoration(),
      child: nextedScroolView(
          streamController: controller,
          scrollController: _scrollController,
          height: height,
          isRounded: isRounded,
          theme: _theme,
          top: top,
          onTapCard: onTapCard),
    );
  }

  onTapCard() {
    print('Chama detalhes do depoimento');
    Navigator.pushNamed(context, '/content/details');
  }
}
