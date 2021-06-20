import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class SubscriptionTypeRegistrationPage extends StatefulWidget {
  @override
  _SubscriptionTypeRegistrationPageState createState() => _SubscriptionTypeRegistrationPageState();
}

class _SubscriptionTypeRegistrationPageState extends State<SubscriptionTypeRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de tipo de assinatura"),
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
                  Text("Nome do plano"),
                  OwTextField(
                    fieldType: TextFieldTypes.name,
                    hintText: "Nome do plano",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Text("Valor do plano"),
                  OwTextField(
                    // fieldType: TextFieldTypes.money,
                    hintText: "R\$ 0,00",
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