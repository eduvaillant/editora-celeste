import 'dart:convert';

class Escritor {
  int? id;
	String? nomeArtistico;
	String? emailEscritor;
	String? telefone;
	String? imagem;
  
  Escritor({
    this.id,
    this.nomeArtistico,
    this.emailEscritor,
    this.telefone,
    this.imagem,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomeArtistico': nomeArtistico,
      'emailEscritor': emailEscritor,
      'telefone': telefone,
      'imagem': imagem,
    };
  }

  factory Escritor.fromMap(Map<String, dynamic> map) {
    return Escritor(
      id: map['id'],
      nomeArtistico: map['nomeArtistico'] ?? map['nome_artistico'],
      emailEscritor: map['emailEscritor'] ?? map['email_escritor'],
      telefone: map['telefone'],
      imagem: map['imagem'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Escritor.fromJson(String source) => Escritor.fromMap(json.decode(source));

  Escritor copyWith({
    int? id,
    String? nomeArtistico,
    String? emailEscritor,
    String? telefone,
    String? imagem,
  }) {
    return Escritor(
      id: id ?? this.id,
      nomeArtistico: nomeArtistico ?? this.nomeArtistico,
      emailEscritor: emailEscritor ?? this.emailEscritor,
      telefone: telefone ?? this.telefone,
      imagem: imagem ?? this.imagem,
    );
  }
}
