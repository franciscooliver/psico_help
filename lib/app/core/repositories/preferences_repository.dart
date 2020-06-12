import 'package:psico_help/app/core/interfaces/preferences_repository.dart';
import 'package:psico_help/app/core/responses/response_builder.dart';
import 'package:psico_help/app/core/responses/response_default.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository implements IPreferences {
  String _userId;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<DefaultResponse> getString(String key) async {
    try {
      var prefs = await _prefs;
      var res = prefs.getString(key);

      return ResponseBuilder.success(object: res);

    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }
  
  @override
  Future<DefaultResponse> getStringObj(key) async {
    try {
      var prefs = await _prefs;
      var res = prefs.getStringList(key);

      return ResponseBuilder.success(object: res);

    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }
  
  @override
  Future<DefaultResponse> getInt(String key) async {
    try {
      var prefs = await _prefs;
      int res = prefs.getInt(key);
      
      return ResponseBuilder.success(object: res);

    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> getBool(String key) async {
    try {
      var prefs = await _prefs;
      bool res = prefs.getBool(key);
      
      return ResponseBuilder.success(object: res);

    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> getUser() async {
      try {
      var prefs = await _prefs;
      var res = prefs.getString('ID');
      print(res);
      return ResponseBuilder.success(object: res);

    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> setString(key, value) async {
    try {
      var prefs = await _prefs;
      bool res = await prefs.setString(key, value);
      return ResponseBuilder.success(object: res);

    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> setInt(key, value)  async {
    try {
      var prefs = await _prefs;
      bool res = await prefs.setInt(key, value);
      return ResponseBuilder.success(object: res);

    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> setBool(key, value) async {
   try {
      var prefs = await _prefs;
      bool res = await prefs.setBool(key, value);
      return ResponseBuilder.success(object: res);

    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> setUserID(key, value) async {
   
  }

  @override
  Future<DefaultResponse> setUser(key, value) async {
    print("Set user chamado");
    _userId = value;
    try {
        var prefs = await _prefs;
        bool res = await prefs.setString(key, value);
        return ResponseBuilder.success(object: res);

      } catch (e) {
        return ResponseBuilder.failed(object: e, message: e.toString());
      }
  }


@override
  Future<DefaultResponse> setStringObj(key, List<String> values) async {
    try {
      var prefs = await _prefs;
      bool res = await prefs.setStringList(key, values);
      return ResponseBuilder.success(object: res);

    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<void> clear() async {
     var prefs = await _prefs;
     prefs.clear();
  }

}