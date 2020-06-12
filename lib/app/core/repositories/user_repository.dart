import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psico_help/app/core/enums/app_enum.dart';
import 'package:psico_help/app/core/interfaces/user_repository.dart';
import 'package:psico_help/app/core/responses/response_builder.dart';
import 'package:psico_help/app/model/user.model.dart';
import 'package:psico_help/app/core/responses/response_default.dart';

class UserRepository implements IUser {
  Firestore firestore;

  UserRepository(this.firestore);

  @override
  Future<DefaultResponse> save(User user) async {
    try {
      String credentials = user.password.trim();
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String passEconded = stringToBase64.encode(credentials);
      user.password = passEconded;

      await firestore.collection('users').document().setData(user.toJson());

      return ResponseBuilder.success(object: ResponseStatus.Success, message: "Usuário cadastrado");
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> update(User user) async {
    try {
      await firestore
          .collection('users')
          .document('${user.documentId}')
          .updateData(user.toJson());

      return ResponseBuilder.success( message: "Usuário atualizado");
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> delete(User user) async {
    try {
      await firestore
          .collection('users')
          .document('${user.documentId}')
          .delete();

      return ResponseBuilder.success(message: "Success");

    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> getUserById(String id) async {
    try {
      var res = await firestore
          .collection('users')
          .document(id)
          .get()
          .then((value) => {
            print(value)
          });
          

      return ResponseBuilder.success(object: res);

    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  dynamic doLoginEmailPassword({String email, String password}) async {
    User user;
    try {
      var users = firestore.collection('users');
      final allList = await users.getDocuments();
      var findUSer = allList.documents.where((doc) => doc["email"] == email && doc["password"] == password);
      
      findUSer.map((u) => {
        user = User.fromDocument(u),
      }).toList();

      return user;
      
    } catch (e) {
      print(e.toString());
    }

  }
}
