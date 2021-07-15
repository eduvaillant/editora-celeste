import 'dart:async';

import 'package:editora_celeste/apis/valid.dart';
import 'package:editora_celeste/domain/entidades/Livro.dart';
import 'package:editora_celeste/ui/components/cards/card_livro_vertical.dart';
import 'package:editora_celeste/ui/pages/outros/book_registration_page.dart';
import 'package:flutter/material.dart';
import 'package:components_venver/material.dart';

class ListarLivrosTela extends StatefulWidget {
  const ListarLivrosTela({ Key? key }) : super(key: key);

  @override
  _ListarLivrosTelaState createState() => _ListarLivrosTelaState();
}

class _ListarLivrosTelaState extends State<ListarLivrosTela> {

  List<Livro> livros = [];
  final StreamController _streamController = StreamController<Map>.broadcast();

  @override
  void initState() {
    super.initState();
    chamarApi();
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _streamController.stream,
        builder: (contex, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return _loading();
            default:
              if(snapshot.hasError || snapshot.data == null) {
                return OcorreuUmErro();
              } else {
                if(livros.isEmpty){
                  return _notFound();
                } else {
                  return _listarLivros();
                }
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => BookRegistrationPage(
                Livro()
              )
            )
          );
        }, 
        label: Text("Adicionar"),
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _listarLivros() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: OwGrid.builder(
        padding: EdgeInsets.all(20),
        spacing: 20,
        runSpacing: 20,
        numbersInRowAccordingToWidgth: [850, 1450, 2200],
        itemCount: livros.length,
        itemBuilder: (context, index) {
          return CardLivroVertical(
            livros[index]
          );
        },
      ),
    );
  }

  Widget _notFound() {
    return NenhumItem(
      titulo: "Nenhum livro",
      subtitulo: "Mas não se preocupe. Volte aqui mais tarde e aproveita para compartilhar a Editora Celeste com seus amigos.",
    );
  }

  _loading() {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).appBarTheme.actionsIconTheme!.color!),
          strokeWidth: 5.0,
        ),
      ),
    );
  }

  Future<bool> chamarApi() async {
    Map retornoDaApi = await Api.listarLivros();
    if(retornoDaApi["code"] == "200") {
      retornoDaApi["success"].forEach((element) {
        Livro livroTemp = Livro.fromMap(element);
        livros.add(livroTemp);
      });
    }

    _streamController.add(retornoDaApi);

    return true;
  }
}