import 'dart:convert';
import 'dart:io';
import 'package:editora_celeste/app/variaveis.dart';
import 'package:editora_celeste/domain/entidades/Usuario.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUsuario {
  DatabaseUsuario._();

  static iniciar() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "/usuario.db";
    var database = await openDatabase(path,
        version: 1, onUpgrade: (Database db, int version, int info) async {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE usuario (" +
          "id integer primary key autoincrement, " +
          "usuario TEXT)");
    });
    return database;
  }

  static inserir(dados) async {
    if (kIsWeb || Platform.isWindows) {
      await SharedPreferences.getInstance().then((prefs) async {
        prefs.setString('usuario', dados);
      });
    } else {
      var database = await iniciar();
      await database.rawInsert('INSERT into usuario(usuario)' + ' values(?)', [dados]);
      await fechar(database);
    }
  }

  static atualizar(Usuario usuarioTemp) async {
    if(kIsWeb || Platform.isWindows) {
      await SharedPreferences.getInstance().then((prefs) async {
        prefs.setString('usuario', jsonEncode(usuarioTemp.toMap()));
      });
      userStore.user = usuarioTemp;
    } else {
      var database = await iniciar();
      await database.rawUpdate(
        'UPDATE usuario SET usuario = ?',
        [jsonEncode(usuarioTemp.toMap())],
      );
      userStore.user = await ler();
      userStore.user = usuarioTemp;
    }
  }

  static Future<Usuario> ler() async {
    if(kIsWeb || Platform.isWindows) {
      Usuario usuarioTemp = Usuario();
      await SharedPreferences.getInstance().then((prefs) async {
        String? retorno = prefs.getString('usuario');
        try {
          usuarioTemp = Usuario.fromMap(jsonDecode(retorno!));
        } catch (e) {}
      });
      userStore.user = usuarioTemp;
      return usuarioTemp;
    } else {
      var database = await iniciar();
      List lista = await database.query("usuario", columns: ["*"], where: "id>?", whereArgs: ["0"]);

      Usuario usuarioTemp = Usuario();

      if (lista.isNotEmpty) {
        Map<String, dynamic> usuarioTempMap = jsonDecode(lista[0]["usuario"]);
        usuarioTemp = Usuario.fromMap(usuarioTempMap);
      }
      userStore.user = usuarioTemp;
      return usuarioTemp;
    }
  }

  static remover() async {
    if(kIsWeb || Platform.isWindows) {
      await SharedPreferences.getInstance().then((prefs) async {
        prefs.remove('usuario');
      });
    } else {
      var database = await iniciar();
      await database.rawDelete("DELETE FROM usuario");
      await fechar(database);
    }
  }

  static fechar(database) async {
    await database.close();
  }
}
