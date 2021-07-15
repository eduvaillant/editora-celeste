import 'package:editora_celeste/apis/valid.dart';
import 'package:editora_celeste/domain/entidades/UF.dart';
import 'package:flutter/material.dart';
import 'package:components_venver/material.dart';

class UfTela extends StatefulWidget {
  final UF? uf;
  const UfTela({this.uf,  Key? key }) : super(key: key);

  @override
  _UfTelaState createState() => _UfTelaState();
}

class _UfTelaState extends State<UfTela> {
  String label = "Adicionar";

  TextEditingController sigla = TextEditingController();
  TextEditingController nome = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.uf?.nome != null) {
      nome.text = widget.uf!.nome!;
      sigla.text = widget.uf!.sigla!;
      label = "Atualizar";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$label UF".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          label == "Atualizar"
            ? IconButton(
                onPressed: () async {
                  Map retornoDaApi = await Api.deletarUf(widget.uf!.id!);
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
              controller: sigla,
              fieldType: TextFieldTypes.name,
              hintText: "Sigla",
              labelText: "Sigla",
              margin: EdgeInsets.only(bottom: 10),
            ),
            OwTextField(
              controller: nome,
              fieldType: TextFieldTypes.name,
              hintText: "Nome da UF",
              labelText: "Nome da UF",
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
            "id": widget.uf?.id,
            "sigla": sigla.text,
            "nome": nome.text
          };
          if(label == "Adicionar") {
            Map retornoDaApi = await Api.adicionarUf(enviarApi);
            if(retornoDaApi["success"]["error"] == null) {
              OwBotToast.toast("Adicionado com sucesso");
              Navigator.pop(context);
            } else {
              OwBotToast.toast("${retornoDaApi["success"]["message"]}");
            }
          } else {
            Map retornoDaApi = await Api.atualizarUf(enviarApi);
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