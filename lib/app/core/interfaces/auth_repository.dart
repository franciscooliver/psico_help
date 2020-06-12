import 'package:psico_help/app/core/responses/response_default.dart';

abstract class IAuthRepository {
  Future<DefaultResponse> doLoginGoogle();
  Future<DefaultResponse> doLoginEmailPassword({ String email, String password });
  Future<DefaultResponse> doRegisterEmailPassword({ String email, String password });
  Future<DefaultResponse> getUSer();
  Future<DefaultResponse> logOut();
}