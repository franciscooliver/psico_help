import 'package:psico_help/app/core/responses/response_default.dart';
import 'package:psico_help/app/model/user.model.dart';

abstract class IUser {
  Future<DefaultResponse> save(User user);
  Future<DefaultResponse> getUserById(String id);
  Future<DefaultResponse> update(User user);
  Future<DefaultResponse> delete(User user);
  doLoginEmailPassword({ String email, String password });
}