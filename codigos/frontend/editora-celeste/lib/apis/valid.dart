import 'package:bot_toast/bot_toast.dart';
import 'package:components_venver/material.dart';
import 'package:editora_celeste/apis/bairros/bairros.dart';
import 'package:editora_celeste/apis/capitulos/capitulos.dart';
import 'package:editora_celeste/apis/cidades/cidades.dart';
import 'package:editora_celeste/apis/escritores/escritores.dart';
import 'package:editora_celeste/apis/livros/livros.dart';
import 'package:editora_celeste/apis/ufs/ufs.dart';
import 'package:editora_celeste/app/variaveis.dart';
import 'package:editora_celeste/databases/usuario.dart';

class Api {
  Api._();

  static Future<Map<dynamic, dynamic>> verificarRequisicao(dynamic funcaoApi, {bool exibirToast = false}) async {
    dynamic retornoApi = {};
    if (exibirToast) OwBotToast.loading();
    retornoApi = await funcaoApi;

    if(retornoApi != Map) {
      retornoApi = {
        "code": "200",
        "success": retornoApi
      };
    }
    
    if (retornoApi["code"].toString() == "9542") {
      if (userStore.user!.nome != null) {
        DatabaseUsuario.remover();
      }
    }
    BotToast.closeAllLoading();
    return retornoApi;
  }
  
  // ! APIS DE LIVROS
  static adicionarLivros(Map dados, {bool exibirToast = false}) => verificarRequisicao(ApiLivros.adicionar(dados), exibirToast: exibirToast);
  static atualizarLivro(Map dados, {bool exibirToast = false}) => verificarRequisicao(ApiLivros.atualizar(dados), exibirToast: exibirToast);
  static deletarLivro(int id, {bool exibirToast = false}) => verificarRequisicao(ApiLivros.deletar(id), exibirToast: exibirToast);
  static listarLivros({bool exibirToast = false}) => verificarRequisicao(ApiLivros.listar(), exibirToast: exibirToast);

  // ! APIS DE ESCRITORES
  static listarEscritores({bool exibirToast = false}) => verificarRequisicao(ApiEscritores.listar(), exibirToast: exibirToast);
  static adicionarEscritor(Map dados, {bool exibirToast = false}) => verificarRequisicao(ApiEscritores.adicionar(dados), exibirToast: exibirToast);
  static atualizarEscritor(Map dados, {bool exibirToast = false}) => verificarRequisicao(ApiEscritores.atualizar(dados), exibirToast: exibirToast);
  static deletarrEscritor(int id, {bool exibirToast = false}) => verificarRequisicao(ApiEscritores.deletar(id), exibirToast: exibirToast);

  // ! APIS DE UFS
  static listarUfs({bool exibirToast = false}) => verificarRequisicao(ApiUfs.listar(), exibirToast: exibirToast);
  static adicionarUf(Map dados, {bool exibirToast = false}) => verificarRequisicao(ApiUfs.adicionar(dados), exibirToast: exibirToast);
  static atualizarUf(Map dados, {bool exibirToast = false}) => verificarRequisicao(ApiUfs.atualizar(dados), exibirToast: exibirToast);
  static deletarUf(int id, {bool exibirToast = false}) => verificarRequisicao(ApiUfs.deletar(id), exibirToast: exibirToast);

  // ! APIS DE CIDADE
  static listarCidades({bool exibirToast = false}) => verificarRequisicao(ApiCidades.listar(), exibirToast: exibirToast);
  static adicionarCidade(Map dados, {bool exibirToast = false}) => verificarRequisicao(ApiCidades.adicionar(dados), exibirToast: exibirToast);
  static atualizarCidade(Map dados, {bool exibirToast = false}) => verificarRequisicao(ApiCidades.atualizar(dados), exibirToast: exibirToast);
  static deletarCidade(int id, {bool exibirToast = false}) => verificarRequisicao(ApiCidades.deletar(id), exibirToast: exibirToast);

  // ! APIS DE BAIRRO
  static listarBairros({bool exibirToast = false}) => verificarRequisicao(ApiBairros.listar(), exibirToast: exibirToast);
  static adicionarBairro(Map dados, {bool exibirToast = false}) => verificarRequisicao(ApiBairros.adicionar(dados), exibirToast: exibirToast);
  static atualizarBairro(Map dados, {bool exibirToast = false}) => verificarRequisicao(ApiBairros.atualizar(dados), exibirToast: exibirToast);
  static deletarBairro(int id, {bool exibirToast = false}) => verificarRequisicao(ApiBairros.deletar(id), exibirToast: exibirToast);

  // ! APIS DE BAIRRO
  static listarCapitulos({bool exibirToast = false}) => verificarRequisicao(ApiCapitulos.listar(), exibirToast: exibirToast);
  static adicionarCapitulo(Map dados, {bool exibirToast = false}) => verificarRequisicao(ApiCapitulos.adicionar(dados), exibirToast: exibirToast);
  static atualizarCapitulo(Map dados, {bool exibirToast = false}) => verificarRequisicao(ApiCapitulos.atualizar(dados), exibirToast: exibirToast);
  static deletarCapitulo(int id, {bool exibirToast = false}) => verificarRequisicao(ApiCapitulos.deletar(id), exibirToast: exibirToast);

}