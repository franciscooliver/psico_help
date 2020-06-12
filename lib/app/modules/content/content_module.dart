import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:psico_help/app/controllers/content_controller.dart';
import 'package:psico_help/app/core/interfaces/content_repository.dart';
import 'package:psico_help/app/core/repositories/content_repository.dart';
import 'package:psico_help/app/modules/content/create.view.dart';
import 'package:psico_help/app/modules/content/details.view.dart';
import 'package:psico_help/app/modules/content/home.view.dart';



class ContentModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => ContentController(i.get())
    ),
    Bind<IContentRepositoty>(
      (i) => ContentRepository(Firestore.instance),
    ),
  ];

  @override
  List<Router> get routers =>[
    Router('/', child: (_, __) => Home()),
    Router('/details', child: (_, __) => DetailsContent()),
     Router('/create', child: (_, __) => CreateContent())
  ];

  static Inject get to => Inject<ContentModule>.of();

}