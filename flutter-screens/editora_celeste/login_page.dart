import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

import 'reader_registration_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editora Celeste"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.perm_identity_outlined, size: 50,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email"),
                  OwTextField(
                    fieldType: TextFieldTypes.email,
                    hintText: "Email",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Text("Senha"),
                  OwTextField(
                    fieldType: TextFieldTypes.password,
                    hintText: "Senha",
                    margin: EdgeInsets.only(bottom: 30),
                  ),
                ],
              ),
              GestureDetector(
                child: Text("Registrar-se"),
                onTap: () {
                  OwRouter.bottomStack(context, ReaderRegistrationPage());
                },
              ),
              SizedBox(height: 10,),
              Text("Esqueci minha senha"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: OwButton(
        margin: EdgeInsets.all(8),
        labelText: "Entrar",
        onPressed: () {

        },
      ),
    );
  }
}