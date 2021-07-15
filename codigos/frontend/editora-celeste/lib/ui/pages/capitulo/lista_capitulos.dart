import 'dart:async';

import 'package:editora_celeste/apis/valid.dart';
import 'package:editora_celeste/domain/entidades/Capitulo.dart';
import 'package:editora_celeste/ui/pages/capitulo/capitulo.dart';
import 'package:editora_celeste/ui/pages/cidade/cidade.dart';
import 'package:flutter/material.dart';
import 'package:components_venver/material.dart';

class ListaCapitulosTela extends StatefulWidget {
  const ListaCapitulosTela({ Key? key }) : super(key: key);

  @override
  _ListaCapitulosTelaState createState() => _ListaCapitulosTelaState();
}

class _ListaCapitulosTelaState extends State<ListaCapitulosTela> {

  List<Capitulo> capitulos = [];
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
          "Capítulos".toUpperCase(),
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
                if(capitulos.isEmpty){
                  return _notFound();
                } else {
                  return _listarCidades();
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
              builder: (context) => CidadeTela()
            )
          );
        }, 
        label: Text("Adicionar"),
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _listarCidades() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: capitulos.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => CapituloTela(
                    capitulo: capitulos[index],
                  )
                )
              );
            },
            title: Text("${capitulos[index].titulo}"),
          );
        },
      )
    );
  }

  Widget _notFound() {
    return NenhumItem(
      titulo: "Nenhum capitulo",
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
    Map retornoDaApi = await Api.listarCapitulos();
    if(retornoDaApi["code"] == "200") {
      retornoDaApi["success"]?.forEach((element) {
        Capitulo capituloTemp = Capitulo.fromMap(element);
        capitulos.add(capituloTemp);
      });
    }

    _streamController.add(retornoDaApi);

    return true;
  }
}