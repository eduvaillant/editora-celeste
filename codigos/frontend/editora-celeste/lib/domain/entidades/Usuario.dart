import 'dart:convert';

import 'Bairro.dart';

class Usuario {
	int? id;
	String? nome;
  String? cpf;
  String? rua;
  int? numero;
  String? dataDeNascimento;
	String? email;
  String? senha;
  Bairro? bairro;

  Usuario({
    this.id,
    this.nome,
    this.cpf,
    this.rua,
    this.numero,
    this.dataDeNascimento,
    this.email,
    this.senha,
    this.bairro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'rua': rua,
      'numero': numero,
      'dataDeNascimento': dataDeNascimento,
      'email': email,
      'senha': senha,
      'bairro': bairro?.toMap(),
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      cpf: map['cpf'],
      rua: map['rua'],
      numero: map['numero'],
      dataDeNascimento: map['dataDeNascimento'],
      email: map['email'],
      senha: map['senha'],
      bairro: Bairro.fromMap(map['bairro']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) => Usuario.fromMap(json.decode(source));

  Usuario copyWith({
    int? id,
    String? nome,
    String? cpf,
    String? rua,
    int? numero,
    String? dataDeNascimento,
    String? email,
    String? senha,
    Bairro? bairro,
  }) {
    return Usuario(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      rua: rua ?? this.rua,
      numero: numero ?? this.numero,
      dataDeNascimento: dataDeNascimento ?? this.dataDeNascimento,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      bairro: bairro ?? this.bairro,
    );
  }
}
