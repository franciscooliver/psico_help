import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:psico_help/app/controllers/user_controller.dart';
import 'package:psico_help/app/core/interfaces/preferences_repository.dart';
import 'package:psico_help/app/core/interfaces/user_repository.dart';
import 'package:psico_help/app/core/repositories/preferences_repository.dart';
import 'package:psico_help/app/core/repositories/user_repository.dart';
import 'package:psico_help/app/modules/signup/home.view.dart';


class SignupModule extends ChildModule {

  @override
  List<Bind> get binds => [
    Bind((i) => UserController(i.get())
    ),
    Bind<IUser>(
      (i) => UserRepository(Firestore.instance),
    ),
    Bind<IPreferences>(
      (i) => PreferencesRepository(),
    )
  ];

  @override
  List<Router> get routers => [
    Router('/', child: (context, args) => Home()),
  ];

  static Inject get to => Inject<SignupModule>.of();

}