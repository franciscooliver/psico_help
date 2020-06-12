import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:psico_help/app/app.dart';
import 'package:psico_help/app/core/interfaces/auth_repository.dart';
import 'package:psico_help/app/core/repositories/auth_repository.dart';


import 'core/interfaces/preferences_repository.dart';
import 'core/repositories/preferences_repository.dart';
import 'modules/content/content_module.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/signup/signup_module.dart';


class AppModule extends MainModule{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  List<Bind> get binds => [
    Bind<IAuthRepository>(
      (i) => AuthRepository(firebaseAuth),
    ),
    Bind<IPreferences>(
    (i) => PreferencesRepository(),
    )
  ];

  @override
  List<Router> get routers => [
    Router('/', 
      module: HomeModule(), 
      transition: TransitionType.fadeIn
    ),
    Router(
    '/content',
    module: ContentModule(),
  ),
    Router('/home', module: LoginModule()),
    Router('/signin', module: LoginModule()),
    Router('/signup', module: SignupModule()),
  ];

  @override
  Widget get bootstrap => App();

  static Inject get to => Inject<AppModule>.of();

}