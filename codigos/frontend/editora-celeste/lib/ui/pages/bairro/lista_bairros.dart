import 'dart:async';

import 'package:editora_celeste/apis/valid.dart';
import 'package:editora_celeste/domain/entidades/Bairro.dart';
import 'package:editora_celeste/ui/pages/bairro/bairro.dart';
import 'package:editora_celeste/ui/pages/cidade/cidade.dart';
import 'package:flutter/material.dart';
import 'package:components_venver/material.dart';

class ListaBairrosTela extends StatefulWidget {
  const ListaBairrosTela({ Key? key }) : super(key: key);

  @override
  _ListaBairrosTelaState createState() => _ListaBairrosTelaState();
}

class _ListaBairrosTelaState extends State<ListaBairrosTela> {

  List<Bairro> bairros = [];
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
      appBar: AppBar(
        title: Text(
          "Bairros".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
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
                if(bairros.isEmpty){
                  return _notFound();
                } else {
                  return _listarBairros();
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
              builder: (context) => BairroTela()
            )
          );
        }, 
        label: Text("Adicionar"),
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _listarBairros() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: bairros.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => BairroTela(
                    bairro: bairros[index],
                  )
                )
              );
            },
            title: Text("${bairros[index].nome}"),
            subtitle: Text("${bairros[index].cidade!.nome}"),
          );
        },
      )
    );
  }

  Widget _notFound() {
    return NenhumItem(
      titulo: "Nenhum bairro",
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
    Map retornoDaApi = await Api.listarBairros();
    if(retornoDaApi["code"] == "200") {
      retornoDaApi["success"].forEach((element) {
        Bairro bairroTemp = Bairro.fromMap(element);
        bairros.add(bairroTemp);
      });
    }

    _streamController.add(retornoDaApi);

    return true;
  }
}