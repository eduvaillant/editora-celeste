import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class FavoriteRegistrationPage extends StatefulWidget {
  @override
  _FavoriteRegistrationPageState createState() => _FavoriteRegistrationPageState();
}

class _FavoriteRegistrationPageState extends State<FavoriteRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar favorito"),
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
                  Text("Nome do autor"),
                  OwDropdown(
                    hintText: "Nome do autor",
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