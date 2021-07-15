import 'dart:convert';

class TipoDeLivro {
	int? id;
	String? genero;
	String? subgenero;
  TipoDeLivro({
    this.id,
    this.genero,
    this.subgenero,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'genero': genero,
      'subgenero': subgenero,
    };
  }

  factory TipoDeLivro.fromMap(Map<String, dynamic> map) {
    return TipoDeLivro(
      id: map['id'],
      genero: map['genero'],
      subgenero: map['subgenero'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TipoDeLivro.fromJson(String source) => TipoDeLivro.fromMap(json.decode(source));

  TipoDeLivro copyWith({
    int? id,
    String? genero,
    String? subgenero,
  }) {
    return TipoDeLivro(
      id: id ?? this.id,
      genero: genero ?? this.genero,
      subgenero: subgenero ?? this.subgenero,
    );
  }
}
