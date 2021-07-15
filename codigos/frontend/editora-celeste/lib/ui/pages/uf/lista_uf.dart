import 'dart:async';

import 'package:editora_celeste/apis/valid.dart';
import 'package:editora_celeste/domain/entidades/UF.dart';
import 'package:editora_celeste/ui/pages/uf/uf.dart';
import 'package:flutter/material.dart';
import 'package:components_venver/material.dart';

class ListarUfTela extends StatefulWidget {
  const ListarUfTela({ Key? key }) : super(key: key);

  @override
  _ListarUfTelaState createState() => _ListarUfTelaState();
}

class _ListarUfTelaState extends State<ListarUfTela> {

  List<UF> ufs = [];
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
          "UFs",
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
                if(ufs.isEmpty){
                  return _notFound();
                } else {
                  return _listarUfs();
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
              builder: (context) => UfTela()
            )
          );
        }, 
        label: Text("Adicionar"),
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _listarUfs() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: ufs.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => UfTela(
                    uf: ufs[index],
                  )
                )
              );
            },
            title: Text("${ufs[index].nome}"),
            subtitle: Text("${ufs[index].sigla}"),
          );
        },
      )
    );
  }

  Widget _notFound() {
    return NenhumItem(
      titulo: "Nenhuma UF",
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
    Map retornoDaApi = await Api.listarUfs();
    if(retornoDaApi["code"] == "200") {
      retornoDaApi["success"].forEach((element) {
        UF ufTemp = UF.fromMap(element);
        ufs.add(ufTemp);
      });
    }

    _streamController.add(retornoDaApi);

    return true;
  }
}