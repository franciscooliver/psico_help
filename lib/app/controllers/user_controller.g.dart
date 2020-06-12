// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  final _$userAtom = Atom(name: '_UserControllerBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$responseAtom = Atom(name: '_UserControllerBase.response');

  @override
  DefaultResponse<dynamic> get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(DefaultResponse<dynamic> value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  final _$saveUserAsyncAction = AsyncAction('_UserControllerBase.saveUser');

  @override
  Future saveUser(User user) {
    return _$saveUserAsyncAction.run(() => super.saveUser(user));
  }

  final _$doLoginEmailPasswordAsyncAction =
      AsyncAction('_UserControllerBase.doLoginEmailPassword');

  @override
  Future<bool> doLoginEmailPassword(dynamic email, dynamic password) {
    return _$doLoginEmailPasswordAsyncAction
        .run(() => super.doLoginEmailPassword(email, password));
  }

  @override
  String toString() {
    return '''
user: ${user},
response: ${response}
    ''';
  }
}
