// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStoreBase, Store {
  final _$indiceAtualAtom = Atom(name: '_AppStoreBase.indiceAtual');

  @override
  int get indiceAtual {
    _$indiceAtualAtom.reportRead();
    return super.indiceAtual;
  }

  @override
  set indiceAtual(int value) {
    _$indiceAtualAtom.reportWrite(value, super.indiceAtual, () {
      super.indiceAtual = value;
    });
  }

  final _$childGlobalAtom = Atom(name: '_AppStoreBase.childGlobal');

  @override
  Widget? get childGlobal {
    _$childGlobalAtom.reportRead();
    return super.childGlobal;
  }

  @override
  set childGlobal(Widget? value) {
    _$childGlobalAtom.reportWrite(value, super.childGlobal, () {
      super.childGlobal = value;
    });
  }

  final _$childRightAtom = Atom(name: '_AppStoreBase.childRight');

  @override
  Widget? get childRight {
    _$childRightAtom.reportRead();
    return super.childRight;
  }

  @override
  set childRight(Widget? value) {
    _$childRightAtom.reportWrite(value, super.childRight, () {
      super.childRight = value;
    });
  }

  final _$isWebAtom = Atom(name: '_AppStoreBase.isWeb');

  @override
  bool get isWeb {
    _$isWebAtom.reportRead();
    return super.isWeb;
  }

  @override
  set isWeb(bool value) {
    _$isWebAtom.reportWrite(value, super.isWeb, () {
      super.isWeb = value;
    });
  }

  final _$showMenuAtom = Atom(name: '_AppStoreBase.showMenu');

  @override
  bool get showMenu {
    _$showMenuAtom.reportRead();
    return super.showMenu;
  }

  @override
  set showMenu(bool value) {
    _$showMenuAtom.reportWrite(value, super.showMenu, () {
      super.showMenu = value;
    });
  }

  final _$_AppStoreBaseActionController =
      ActionController(name: '_AppStoreBase');

  @override
  dynamic mudarIndex(dynamic index) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.mudarIndex');
    try {
      return super.mudarIndex(index);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChildGlobal(Widget child) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setChildGlobal');
    try {
      return super.setChildGlobal(child);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChildRight(Widget child) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setChildRight');
    try {
      return super.setChildRight(child);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsWeb(bool value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setIsWeb');
    try {
      return super.setIsWeb(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowMenu(bool value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setShowMenu');
    try {
      return super.setShowMenu(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indiceAtual: ${indiceAtual},
childGlobal: ${childGlobal},
childRight: ${childRight},
isWeb: ${isWeb},
showMenu: ${showMenu}
    ''';
  }
}
