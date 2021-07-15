import 'package:editora_celeste/apis/valid.dart';
import 'package:editora_celeste/domain/entidades/Bairro.dart';
import 'package:flutter/material.dart';
import 'package:components_venver/material.dart';

class BairroTela extends StatefulWidget {
  final Bairro? bairro;
  const BairroTela({this.bairro,  Key? key }) : super(key: key);

  @override
  _BairroTelaState createState() => _BairroTelaState();
}

class _BairroTelaState extends State<BairroTela> {

  String label = "Adicionar";

  TextEditingController sigla = TextEditingController();
  TextEditingController nome = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.bairro?.nome != null) {
      nome.text = widget.bairro!.nome!;
      label = "Atualizar";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$label Bairro".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          label == "Atualizar"
            ? IconButton(
                onPressed: () async {
                  Map retornoDaApi = await Api.deletarBairro(widget.bairro!.id!);
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
              hintText: "Nome do Bairro",
              margin: EdgeInsets.only(bottom: 10),
            ),
            OwDropdown(
              hintText: "Cachoeiro de Itapemirim",
              labelText: "Cidade",
              value: "Cachoeiro de Itapemirim",
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
            "id": widget.bairro?.id,
            "nome": nome.text,
            "cidade": {
                "id": 1
            }
          };
          if(label == "Adicionar") {
            Map retornoDaApi = await Api.adicionarBairro(enviarApi);
            if(retornoDaApi["success"]["error"] == null) {
              OwBotToast.toast("Adicionado com sucesso");
              Navigator.pop(context);
            } else {
              OwBotToast.toast("${retornoDaApi["success"]["message"]}");
            }
          } else {
            Map retornoDaApi = await Api.atualizarBairro(enviarApi);
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