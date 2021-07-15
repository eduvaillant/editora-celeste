import 'package:editora_celeste/apis/valid.dart';
import 'package:editora_celeste/domain/entidades/Capitulo.dart';
import 'package:flutter/material.dart';
import 'package:components_venver/material.dart';

class CapituloTela extends StatefulWidget {
  final Capitulo? capitulo;
  const CapituloTela({this.capitulo, Key? key }) : super(key: key);

  @override
  _CapituloTelaState createState() => _CapituloTelaState();
}

class _CapituloTelaState extends State<CapituloTela> {
  String label = "Adicionar";

  TextEditingController nome = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.capitulo?.titulo != null) {
      nome.text = widget.capitulo!.titulo!;
      label = "Atualizar";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$label Capítulos".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          label == "Atualizar"
            ? IconButton(
                onPressed: () async {
                  Map retornoDaApi = await Api.deletarCidade(widget.capitulo!.id!);
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
            "id": widget.capitulo?.id,
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