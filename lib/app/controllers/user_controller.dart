import 'package:mobx/mobx.dart';
import 'package:psico_help/app/core/constantes.dart';
import 'package:psico_help/app/core/interfaces/user_repository.dart';
import 'package:psico_help/app/core/repositories/preferences_repository.dart';
import 'package:psico_help/app/core/responses/response_default.dart';
import 'package:psico_help/app/model/user.model.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final IUser repository;
  PreferencesRepository preferences;
  
  _UserControllerBase(this.repository);

  @observable
  User user;

  @observable
  DefaultResponse response;

  @action
  saveUser(User user) async {
    response = await this.repository.save(user);
  }

  @action
  Future<bool> doLoginEmailPassword(email, password) async {
    user = await this.repository.doLoginEmailPassword(email: email, password: password);
    var res;
    if(user != null){
      preferences = PreferencesRepository();
      res = await this.preferences.setUser('ID', user.documentId);
      
      await this.preferences.setBool('IS_ADMIN', user.isAdmin);
      await this.preferences.getBool('IS_ADMIN');

      return res.object;    
    }else{
       print("Usuário nao encontrado");
       return false;
    }
    
  }

}