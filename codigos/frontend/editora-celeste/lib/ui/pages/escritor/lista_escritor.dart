import 'dart:async';

import 'package:editora_celeste/apis/valid.dart';
import 'package:editora_celeste/domain/entidades/Escritor.dart';
import 'package:editora_celeste/ui/components/cards/card_escritor_vertical.dart';
import 'package:editora_celeste/ui/pages/outros/writer_registration_page.dart';
import 'package:flutter/material.dart';
import 'package:components_venver/material.dart';

class ListarEscritoresTela extends StatefulWidget {
  const ListarEscritoresTela({ Key? key }) : super(key: key);

  @override
  _ListarEscritoresTelaState createState() => _ListarEscritoresTelaState();
}

class _ListarEscritoresTelaState extends State<ListarEscritoresTela> {

  List<Escritor> escritores = [];
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
                if(escritores.isEmpty){
                  return _notFound();
                } else {
                  return _listarEscritores();
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
              builder: (context) => WriterRegistrationPage(
                Escritor()
              ),
            ),
          );
        }, 
        label: Text("Adicionar"),
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _listarEscritores() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: OwGrid.builder(
        padding: EdgeInsets.all(20),
        spacing: 20,
        runSpacing: 20,
        numbersInRowAccordingToWidgth: [550, 780, 980, 1280, 1450, 2200],
        itemCount: escritores.length,
        itemBuilder: (context, index) {
          return CardEscritorVertical(
            escritores[index]
          );
        },
      ),
    );
  }

  Widget _notFound() {
    return NenhumItem(
      titulo: "Nenhum escritor",
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
    Map retornoDaApi = await Api.listarEscritores();
    if(retornoDaApi["code"] == "200") {
      retornoDaApi["success"].forEach((element) {
        Escritor escritorTemp = Escritor.fromMap(element);
        escritores.add(escritorTemp);
      });
    }

    _streamController.add(retornoDaApi);

    return true;
  }
}