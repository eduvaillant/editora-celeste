// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersStore on _UsersStoreBase, Store {
  final _$userAtom = Atom(name: '_UsersStoreBase.user');

  @override
  Usuario? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Usuario? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_UsersStoreBaseActionController =
      ActionController(name: '_UsersStoreBase');

  @override
  dynamic setUser(Usuario item) {
    final _$actionInfo = _$_UsersStoreBaseActionController.startAction(
        name: '_UsersStoreBase.setUser');
    try {
      return super.setUser(item);
    } finally {
      _$_UsersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
