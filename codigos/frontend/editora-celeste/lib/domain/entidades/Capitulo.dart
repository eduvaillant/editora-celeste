import 'dart:convert';

import 'package:editora_celeste/domain/entidades/Livro.dart';

class Capitulo {
	int? id;
	String? titulo;
	String? subtitulo;
	String? conteudo;
	Livro? livro;

  Capitulo({
    this.id,
    this.titulo,
    this.subtitulo,
    this.conteudo,
    this.livro,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'subtitulo': subtitulo,
      'conteudo': conteudo,
      'livro': livro?.toMap(),
    };
  }

  factory Capitulo.fromMap(Map<String, dynamic> map) {
    return Capitulo(
      id: map['id'],
      titulo: map['titulo'],
      subtitulo: map['subtitulo'],
      conteudo: map['conteudo'],
      livro: Livro.fromMap(map['livro']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Capitulo.fromJson(String source) => Capitulo.fromMap(json.decode(source));

  Capitulo copyWith({
    int? id,
    String? titulo,
    String? subtitulo,
    String? conteudo,
    Livro? livro,
  }) {
    return Capitulo(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      subtitulo: subtitulo ?? this.subtitulo,
      conteudo: conteudo ?? this.conteudo,
      livro: livro ?? this.livro,
    );
  }
}
