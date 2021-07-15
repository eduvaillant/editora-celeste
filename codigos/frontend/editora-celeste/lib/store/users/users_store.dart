import 'package:editora_celeste/domain/entidades/Usuario.dart';
import 'package:mobx/mobx.dart';
part 'users_store.g.dart';

class UsersStore = _UsersStoreBase with _$UsersStore;

abstract class _UsersStoreBase with Store {

  @observable
  Usuario? user;

  @action
  setUser(Usuario item){
    this.user = item;
  }
}
