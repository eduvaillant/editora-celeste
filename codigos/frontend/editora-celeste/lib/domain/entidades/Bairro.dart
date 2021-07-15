import 'dart:convert';

import 'Cidade.dart';

class Bairro {
	int? id;
	String? nome;
	Cidade? cidade;

  Bairro({
    this.id,
    this.nome,
    this.cidade,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cidade': cidade?.toMap(),
    };
  }

  factory Bairro.fromMap(Map<String, dynamic> map) {
    return Bairro(
      id: map['id'],
      nome: map['nome'],
      cidade: Cidade.fromMap(map['cidade']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bairro.fromJson(String source) => Bairro.fromMap(json.decode(source));

  Bairro copyWith({
    int? id,
    String? nome,
    Cidade? cidade,
  }) {
    return Bairro(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      cidade: cidade ?? this.cidade,
    );
  }
}
