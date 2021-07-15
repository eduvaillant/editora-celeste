import 'dart:convert';

class UF {
  int? id;
  String? sigla;
  String? nome;
  UF({
    this.id,
    this.sigla,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sigla': sigla,
      'nome': nome,
    };
  }

  factory UF.fromMap(Map<String, dynamic> map) {
    return UF(
      id: map['id'],
      sigla: map['sigla'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UF.fromJson(String source) => UF.fromMap(json.decode(source));

  UF copyWith({
    int? id,
    String? sigla,
    String? nome,
  }) {
    return UF(
      id: id ?? this.id,
      sigla: sigla ?? this.sigla,
      nome: nome ?? this.nome,
    );
  }
}
