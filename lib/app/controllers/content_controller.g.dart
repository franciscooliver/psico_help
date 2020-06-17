// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContentController on _ContentControllerBase, Store {
  final _$contentListAtom = Atom(name: '_ContentControllerBase.contentList');

  @override
  ObservableStream<List<Content>> get contentList {
    _$contentListAtom.reportRead();
    return super.contentList;
  }

  @override
  set contentList(ObservableStream<List<Content>> value) {
    _$contentListAtom.reportWrite(value, super.contentList, () {
      super.contentList = value;
    });
  }

  final _$_ContentControllerBaseActionController =
      ActionController(name: '_ContentControllerBase');

  @override
  dynamic getContents() {
    final _$actionInfo = _$_ContentControllerBaseActionController.startAction(
        name: '_ContentControllerBase.getContents');
    try {
      return super.getContents();
    } finally {
      _$_ContentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
    contentList: ${contentList}
    ''';
  }
}
