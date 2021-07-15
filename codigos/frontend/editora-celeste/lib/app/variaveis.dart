import 'package:editora_celeste/store/app.dart';
import 'package:editora_celeste/store/users/users_store.dart';

import 'package:get_it/get_it.dart';

final appStore = GetIt.I.get<AppStore>();
final userStore = GetIt.I.get<UsersStore>();

final String url = "https://editora-celeste.herokuapp.com/";
final String urlApi = "https://editora-celeste.herokuapp.com/";