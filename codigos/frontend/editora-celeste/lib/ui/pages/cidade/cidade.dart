import 'package:editora_celeste/apis/valid.dart';
import 'package:editora_celeste/domain/entidades/Cidade.dart';
import 'package:flutter/material.dart';
import 'package:components_venver/material.dart';

class CidadeTela extends StatefulWidget {
  final Cidade? cidade;
  const CidadeTela({this.cidade, Key? key }) : super(key: key);

  @override
  _CidadeTelaState createState() => _CidadeTelaState();
}

class _CidadeTelaState extends State<CidadeTela> {
  String label = "Adicionar";

  TextEditingController nome = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.cidade?.nome != null) {
      nome.text = widget.cidade!.nome;
      label = "Atualizar";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$label Cidade".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          label == "Atualizar"
            ? IconButton(
                onPressed: () async {
                  Map retornoDaApi = await Api.deletarCidade(widget.cidade!.id);
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
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OwTextField(
              controller: nome,
              fieldType: TextFieldTypes.name,
              hintText: "Nome da Cidade",
              margin: EdgeInsets.only(bottom: 10),
            ),
            OwDropdown(
              labelText: "UF",
              hintText: "Espiríto Santo",
              value: "Espiríto Santo",
              margin: EdgeInsets.only(bottom: 10),
            ),
          ],
        ),
      ),
      bottomNavigationBar: OwButton.secondary(
        color: Theme.of(context).accentColor,
        margin: EdgeInsets.all(8),
        labelText: label,
        onPressed: () async {
          Map enviarApi = {
            "id": widget.cidade?.id,
            "nome": nome.text,
            "uf": {
                "id": 1
            }
          };
          if(label == "Adicionar") {
            Map retornoDaApi = await Api.adicionarCidade(enviarApi);
            if(retornoDaApi["success"]["error"] == null) {
              OwBotToast.toast("Adicionado com sucesso");
              Navigator.pop(context);
            } else {
              OwBotToast.toast("${retornoDaApi["success"]["message"]}");
            }
          } else {
            Map retornoDaApi = await Api.atualizarCidade(enviarApi);
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
}