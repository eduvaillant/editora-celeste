import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class BookRegistrationPage extends StatefulWidget {
  @override
  _BookRegistrationPageState createState() => _BookRegistrationPageState();
}

class _BookRegistrationPageState extends State<BookRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro do livro"),
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
                  Text("Nome"),
                  OwTextField(
                    fieldType: TextFieldTypes.name,
                    hintText: "Nome",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Text("Nome do autor"),
                  OwDropdown(
                    hintText: "Nome do autor",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Wrap(
                    children: [
                      _container("Golfe"),
                      _container("Tênis"),
                      _container("Natação"),
                      _container("Basquete"),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: OwTextField(
                            hintText: "N° de capítulos",
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: OwTextField(
                            hintText: "N° de páginas",
                          ),
                        ),
                      ],
                    ),
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