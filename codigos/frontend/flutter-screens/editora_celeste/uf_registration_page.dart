import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class UfRegistrationPage extends StatefulWidget {
  @override
  _UfRegistrationPageState createState() => _UfRegistrationPageState();
}

class _UfRegistrationPageState extends State<UfRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro da UF"),
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
                  Text("Nome da UF"),
                  OwTextField(
                    fieldType: TextFieldTypes.name,
                    hintText: "Nome da UF",
                    margin: EdgeInsets.only(bottom: 10),
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