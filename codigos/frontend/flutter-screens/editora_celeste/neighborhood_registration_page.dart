import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class NeighborhoodRegistrationPage extends StatefulWidget {
  @override
  _NeighborhoodRegistrationPageState createState() => _NeighborhoodRegistrationPageState();
}

class _NeighborhoodRegistrationPageState extends State<NeighborhoodRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro do bairro"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nome do bairro"),
                  OwTextField(
                    fieldType: TextFieldTypes.name,
                    hintText: "Nome do bairro",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Text("Nome da cidade"),
                  OwDropdown(
                    hintText: "Nome da cidade",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: OwButton(
        margin: EdgeInsets.all(8),
        labelText: "Cadastrar",
        onPressed: () {

        },
      ),
    );
  }
}