import 'dart:convert';

import 'UF.dart';

class Cidade {
	int id;
	String nome;
	UF uf;
  
  Cidade({
    required this.id,
    required this.nome,
    required this.uf,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'uf': uf.toMap(),
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      id: map['id'],
      nome: map['nome'],
      uf: UF.fromMap(map['uf']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cidade.fromJson(String source) => Cidade.fromMap(json.decode(source));

  Cidade copyWith({
    int? id,
    String? nome,
    UF? uf,
  }) {
    return Cidade(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      uf: uf ?? this.uf,
    );
  }
}
