import 'package:editora_celeste/domain/entidades/UF.dart';
import 'package:editora_celeste/ui/pages/bairro/bairro.dart';
import 'package:editora_celeste/ui/pages/bairro/lista_bairros.dart';
import 'package:editora_celeste/ui/pages/capitulo/lista_capitulos.dart';
import 'package:editora_celeste/ui/pages/cidade/cidade.dart';
import 'package:editora_celeste/ui/pages/cidade/lista_cidades.dart';
import 'package:editora_celeste/ui/pages/uf/lista_uf.dart';
import 'package:editora_celeste/ui/pages/uf/uf.dart';
import 'package:flutter/material.dart';

class PerfilUsuarioTela extends StatefulWidget {
  const PerfilUsuarioTela({ Key? key }) : super(key: key);

  @override
  _PerfilUsuarioTelaState createState() => _PerfilUsuarioTelaState();
}

class _PerfilUsuarioTelaState extends State<PerfilUsuarioTela> {

  List itens = [
    // {
    //   "title": "Meus dados",
    //   "page": PerfilUsuarioTela(),
    // },
    // {
    //   "title": "Usuários",
    //   "page": PerfilUsuarioTela(),
    // },
    {
      "title": "Bairros",
      "page": ListaBairrosTela(),
    },
    {
      "title": "Cidades",
      "page": ListaCidadesTela(),
    },
    {
      "title": "UFs",
      "page": ListarUfTela(),
    },
    {
      "title": "Capítulos",
      "page": ListaCapitulosTela(),
    },
    // {
    //   "title": "Tipo de Livro",
    //   "page": PerfilUsuarioTela(),
    // },
    // {
    //   "title": "Tipo de Assinatura",
    //   "page": PerfilUsuarioTela(),
    // },
    // {
    //   "title": "Capítulo",
    //   "page": PerfilUsuarioTela(),
    // },
    // {
    //   "title": "Sair",
    //   "page": PerfilUsuarioTela(),
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Matheus Sanches",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "sanches@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30),
            ListView.separated(
              padding: EdgeInsets.only(
                top: 20,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: itens.length,
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(.2),
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(itens[index]["title"]),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => itens[index]["page"]
                      )
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}