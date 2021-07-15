import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'app.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {

  @observable
  int indiceAtual = 1;

  @observable
  Widget? childGlobal;

  @observable
  Widget? childRight;

  @observable
  bool isWeb = false;

  @observable
  bool showMenu = false;

  @action
  mudarIndex(index) {
    this.indiceAtual = index;
  }

  @action
  setChildGlobal(Widget child) => this.childGlobal = child;

  @action
  setChildRight(Widget child) => this.childRight = child;

  @action
  setIsWeb(bool value) => this.isWeb = value;

  @action
  setShowMenu(bool value) => this.showMenu = value;

}
