import 'dart:convert';

import 'package:editora_celeste/domain/entidades/Escritor.dart';
import 'package:editora_celeste/domain/entidades/TipoDeLivro.dart';

class Livro {
	int? id;
	String? titulo;
	String? subtitulo;
	String? descricao;
	int? qtdCapitulos;
	int? numeroPaginas;
	Escritor? escritor;
	TipoDeLivro? tipoDeLivro;
  String? imagemCapa;
  
  Livro({
    this.id,
    this.titulo,
    this.subtitulo,
    this.descricao,
    this.qtdCapitulos,
    this.numeroPaginas,
    this.escritor,
    this.tipoDeLivro,
    this.imagemCapa,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'subtitulo': subtitulo,
      'descricao': descricao,
      'qtdCapitulos': qtdCapitulos,
      'numeroPaginas': numeroPaginas,
      'escritor': escritor?.toMap(),
      'tipoDeLivro': tipoDeLivro?.toMap(),
      'imagemCapa': imagemCapa,
    };
  }

  factory Livro.fromMap(Map<String, dynamic> map) {
    return Livro(
      id: map['id'],
      titulo: map['titulo'],
      subtitulo: map['subtitulo'],
      descricao: map['descricao'],
      qtdCapitulos: map['qtdCapitulos'] ?? map['qtd_capitulos'],
      numeroPaginas: map['numeroPaginas'] ?? map['numero_paginas'],
      escritor: Escritor.fromMap(map['escritor']),
      tipoDeLivro: TipoDeLivro.fromMap(map['tipoDeLivro'] ?? map['tipo_de_livro']),
      imagemCapa: map['imagemCapa'] ?? map['imagem_capa'] ?? "https://i.pinimg.com/originals/a6/e1/2b/a6e12b6662048bca14a42206c991e46f.jpg",
    );
  }

  String toJson() => json.encode(toMap());

  factory Livro.fromJson(String source) => Livro.fromMap(json.decode(source));

  Livro copyWith({
    int? id,
    String? titulo,
    String? subtitulo,
    String? descricao,
    int? qtdCapitulos,
    int? numeroPaginas,
    Escritor? escritor,
    TipoDeLivro? tipoDeLivro,
    String? imagemCapa,
  }) {
    return Livro(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      subtitulo: subtitulo ?? this.subtitulo,
      descricao: descricao ?? this.descricao,
      qtdCapitulos: qtdCapitulos ?? this.qtdCapitulos,
      numeroPaginas: numeroPaginas ?? this.numeroPaginas,
      escritor: escritor ?? this.escritor,
      tipoDeLivro: tipoDeLivro ?? this.tipoDeLivro,
      imagemCapa: imagemCapa ?? this.imagemCapa
    );
  }
}
