import 'package:psico_help/app/core/responses/response_default.dart';

abstract class IPreferences {
  Future<DefaultResponse> setString(key, value);
  Future<DefaultResponse> setStringObj(key, List<String> values);
  Future<DefaultResponse> setUserID(key, value);
  Future<DefaultResponse> setInt(key, value);
  Future<DefaultResponse> setBool(key, value);
  Future<DefaultResponse> setUser(key, value);
  Future<DefaultResponse> getString(String key);
  Future<DefaultResponse> getStringObj(key);
  Future<DefaultResponse> getInt(String key);
  Future<DefaultResponse> getBool(String key);
  Future<DefaultResponse> getUser();
  Future<void> clear();
}