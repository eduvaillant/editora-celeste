import 'package:components_venver/material.dart';
import 'package:editora_celeste/apis/valid.dart';
import 'package:editora_celeste/domain/entidades/Escritor.dart';
import 'package:flutter/material.dart';

class WriterRegistrationPage extends StatefulWidget {
  final Escritor escritor;
  const WriterRegistrationPage(this.escritor);

  @override
  _WriterRegistrationPageState createState() => _WriterRegistrationPageState();
}

class _WriterRegistrationPageState extends State<WriterRegistrationPage> {
  String label = "Adicionar";

  TextEditingController nome = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController rua = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController nascimento = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController nomeArtistico = TextEditingController();
  TextEditingController emailEscritor = TextEditingController();
  TextEditingController telefone = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.escritor.nomeArtistico != null) {
      nomeArtistico.text = widget.escritor.nomeArtistico!;
      emailEscritor.text = widget.escritor.emailEscritor!;
      telefone.text = widget.escritor.telefone!;
      label = "Atualizar";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$label escritor".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        actions: [
          label == "Atualizar"
            ? IconButton(
                onPressed: () async {
                  Map retornoDaApi = await Api.deletarrEscritor(widget.escritor.id!);
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
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OwTextField(
                    controller: nomeArtistico,
                    fieldType: TextFieldTypes.name,
                    hintText: "Nome artístico",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  OwTextField(
                    controller: emailEscritor,
                    fieldType: TextFieldTypes.name,
                    hintText: "Email escritor",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  OwDropdown(
                    hintText: "Arthur Christie",
                    margin: EdgeInsets.only(bottom: 10),
                    value: "Arthur Christie",
                    labelText: "Nome do Autor",
                  ),
                  OwTextField(
                    controller: telefone,
                    fieldType: TextFieldTypes.name,
                    hintText: "Telefone do escritor",
                    minLines: 3,
                    maxLines: 5,
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: OwButton.secondary(
        color: Theme.of(context).accentColor,
        margin: EdgeInsets.all(8),
        labelText: "$label",
        onPressed: () async {
          Map enviarApi = {
            "id": widget.escritor.id,
            "nome": "João",
            "cpf": "691.346.170-43",
            "rua": "Rua José Barbosa",
            "numero": "15",
            "data_de_nascimento": "1999-11-05",
            "email": "joao@email.com",
            "senha": "123456",
            "bairro": {
              "id": 1
            },
            "nome_artistico": nomeArtistico.text,
            "email_escritor": emailEscritor.text,
            "telefone": telefone.text
          };

          if(label == "Adicionar") {
            Map retornoDaApi = await Api.adicionarEscritor(enviarApi);
            if(retornoDaApi["success"]["error"] == null) {
              OwBotToast.toast("Adicionado com sucesso");
            } else {
              OwBotToast.toast("${retornoDaApi["success"]["message"]}");
            }
          } else {
            Map retornoDaApi = await Api.atualizarEscritor(enviarApi);
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

  Widget _container(String name) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}