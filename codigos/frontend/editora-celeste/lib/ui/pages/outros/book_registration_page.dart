import 'package:components_venver/material.dart';
import 'package:editora_celeste/apis/valid.dart';
import 'package:editora_celeste/domain/entidades/Livro.dart';
import 'package:flutter/material.dart';

class BookRegistrationPage extends StatefulWidget {
  final Livro livro;
  const BookRegistrationPage(this.livro);

  @override
  _BookRegistrationPageState createState() => _BookRegistrationPageState();
}

class _BookRegistrationPageState extends State<BookRegistrationPage> {

  String label = "Adicionar";

  TextEditingController titulo = TextEditingController();
  TextEditingController subtitulo = TextEditingController();
  TextEditingController descricao = TextEditingController();
  TextEditingController capitulo = TextEditingController();
  TextEditingController pagina = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.livro.titulo != null) {
      titulo.text = widget.livro.titulo!;
      subtitulo.text = widget.livro.subtitulo!;
      descricao.text = widget.livro.descricao!;
      capitulo.text = widget.livro.qtdCapitulos!.toString();
      pagina.text = widget.livro.numeroPaginas!.toString();
      label = "Atualizar";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$label livro".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        actions: [
          label == "Atualizar"
            ? IconButton(
                onPressed: () async {
                  Map retornoDaApi = await Api.deletarLivro(widget.livro.id!);
                  if(retornoDaApi["success"]["error"] == null) {
                    OwBotToast.toast("Removido com sucesso");
                    Navigator.pop(context);
                  } else {
                    OwBotToast.toast("${retornoDaApi["success"]["message"]}");
                  }
                }, 
                icon: Icon(Icons.delete)
              )
            : SizedBox()
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OwTextField(
                    controller: titulo,
                    fieldType: TextFieldTypes.name,
                    hintText: "Título do Livro",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  OwTextField(
                    controller: subtitulo,
                    fieldType: TextFieldTypes.name,
                    hintText: "Subtítulo do Livro",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  OwDropdown(
                    hintText: "Arthur Christie",
                    margin: EdgeInsets.only(bottom: 10),
                    value: "Arthur Christie",
                    labelText: "Nome do Autor",
                  ),
                  OwTextField(
                    controller: descricao,
                    fieldType: TextFieldTypes.name,
                    hintText: "Descrição do Livro",
                    minLines: 3,
                    maxLines: 5,
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Wrap(
                    children: [
                      _container("Golfe"),
                      _container("Tênis"),
                      _container("Natação"),
                      _container("Basquete"),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: OwTextField(
                            controller: capitulo,
                            hintText: "N° de capítulos",
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: OwTextField(
                            controller: pagina,
                            hintText: "N° de páginas",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: OwButton.secondary(
        color: Theme.of(context).accentColor,
        margin: EdgeInsets.all(8),
        labelText: "$label",
        onPressed: () async {
          Map enviarApi = {
            "id": widget.livro.id,
            "titulo": titulo.text,
            "subtitulo": subtitulo.text,
            "descricao": descricao.text,
            "qtd_capitulos": int.tryParse(capitulo.text),
            "numero_paginas": int.tryParse(pagina.text),
            "escritor": {
              "id": 3,
              "nome": "Rodolfo da Costa",
              "cpf": "135.521.130-10",
              "rua": "Rua dos anjos",
              "numero": "14",
              "data_de_nascimento": "3900-12-04",
              "email": "arthur@gmail.com",
              "senha": "123456",
              "bairro": {
                "id": 1,
                "nome": "Vila do Sul",
                "cidade": {
                  "id": 1,
                  "nome": "Alegre",
                  "uf": {
                    "id": 1,
                    "sigla": "ES",
                    "nome": "Espírito Santo"
                  }
                }
              },
              "nome_artistico": "Arthur Christie",
              "email_escritor": "arthur@gmail.com",
              "telefone": "+5528999112234"
            },
            "tipoDeLivro": {
              "id": 1,
              "genero": "Romance",
              "subgenero": "Comédia"
            }
          };

          if(label == "Adicionar") {
            Map retornoDaApi = await Api.adicionarLivros(enviarApi);
            if(retornoDaApi["success"]["error"] == null) {
              OwBotToast.toast("Adicionado com sucesso");
            } else {
              OwBotToast.toast("${retornoDaApi["success"]["message"]}");
            }
          } else {
            Map retornoDaApi = await Api.atualizarLivro(enviarApi);
            if(retornoDaApi["success"]["error"] == null) {
              OwBotToast.toast("Atualizado com sucesso");
              Navigator.pop(context);
            } else {
              OwBotToast.toast("${retornoDaApi["success"]["message"]}");
            }
          }
        },
      ),
    );
  }

  Widget _container(String name) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}