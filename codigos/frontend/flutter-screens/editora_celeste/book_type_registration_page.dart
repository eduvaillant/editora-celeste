import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class BookTypeRegistrationPage extends StatefulWidget {
  @override
  _BookTypeRegistrationPageState createState() => _BookTypeRegistrationPageState();
}

class _BookTypeRegistrationPageState extends State<BookTypeRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de tipo de livro"),
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
                  Text("Nome do tipo de livro (categoria)"),
                  OwTextField(
                    fieldType: TextFieldTypes.name,
                    hintText: "Nome do tipo de livro (categoria)",
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