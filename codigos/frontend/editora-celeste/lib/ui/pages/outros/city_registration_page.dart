import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class CityRegistrationPage extends StatefulWidget {
  @override
  _CityRegistrationPageState createState() => _CityRegistrationPageState();
}

class _CityRegistrationPageState extends State<CityRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro da cidade"),
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
                  Text("Nome da cidade"),
                  OwTextField(
                    fieldType: TextFieldTypes.name,
                    hintText: "Nome da cidade",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Text("Nome da UF"),
                  OwDropdown(
                    hintText: "Nome da UF",
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