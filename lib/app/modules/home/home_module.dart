import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:psico_help/app/controllers/content_controller.dart';
import 'package:psico_help/app/core/interfaces/content_repository.dart';
import 'package:psico_help/app/core/repositories/content_repository.dart';


import 'home.view.dart';


class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => ContentController(i.get())
    ),
    Bind<IContentRepositoty>(
      (i) => ContentRepository(Firestore.instance),
    )
  ];

  @override
  List<Router> get routers =>[
    Router('/', child: (_, __) => Home(),
    transition: TransitionType.fadeIn)
  ];

  static Inject get to => Inject<HomeModule>.of();

}