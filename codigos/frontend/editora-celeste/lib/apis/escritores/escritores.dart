import 'dart:convert';
import 'package:editora_celeste/app/variaveis.dart';
import 'package:http/http.dart' as http;

class ApiEscritores {
  ApiEscritores._();

  static adicionar(Map dados) async {
    try {
      http.Response response = await http.post(
        Uri.parse("${urlApi}escritores"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(dados)
      );
      if (response.body.isNotEmpty)
        return json.decode(response.body);
      else
        return {};
    } catch (e) {
      return {};
    }
  }

  static atualizar(Map dados) async {
    try {
      http.Response response = await http.put(
        Uri.parse("${urlApi}escritores/${dados['id']}"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(dados)
      );
      if (response.body.isNotEmpty)
        return json.decode(response.body);
      else
        return {};
    } catch (e) {
      return {};
    }
  }

  static deletar(int id) async {
    try {
      http.Response response = await http.delete(
        Uri.parse("${urlApi}escritores/$id"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.body.isNotEmpty)
        return json.decode(response.body);
      else
        return {};
    } catch (e) {
      return {};
    }
  }

  static listar() async {
    try {
      http.Response response = await http.get(
        Uri.parse("${urlApi}escritores"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.body.isNotEmpty)
        return json.decode(response.body);
      else
        return {};
    } catch (e) {
      return {};
    }
  }

}
