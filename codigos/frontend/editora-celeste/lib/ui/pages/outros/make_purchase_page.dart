import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class MakePurchasePage extends StatefulWidget {
  @override
  _MakePurchasePageState createState() => _MakePurchasePageState();
}

class _MakePurchasePageState extends State<MakePurchasePage> {
  String radio = "p";
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Realizar compra"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.grey[300],
                ),
                // height: 200,
                child: _purchaseList(),
              ),
              RadioListTile(
                title: Text("Dinheiro"),
                value: "d",
                groupValue: radio, 
                onChanged: (_) {},
              ),
              RadioListTile(
                title: Text("Pagamento online"),
                value: "p",
                groupValue: radio, 
                onChanged: (_) {},
              ),
              RadioListTile(
                title: Text("Boleto"),
                value: "b",
                groupValue: radio, 
                onChanged: (_) {},
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Número do cartão"),
                  OwTextField(
                    fieldType: TextFieldTypes.cardNumber,
                    hintText: "Número do cartão",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Row(
                    children: [
                      Expanded(child: OwTextField(
                        hintText: "Data de vencimento",
                        fieldType: TextFieldTypes.cardDateYY,
                      )),
                      SizedBox(width: 10,),
                      Expanded(child: OwTextField(
                        hintText: "CVV",
                        fieldType: TextFieldTypes.cardCvv,
                      )),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Nome"),
                  OwTextField(
                    fieldType: TextFieldTypes.name,
                    hintText: "Nome",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Text("CPF"),
                  OwTextField(
                    fieldType: TextFieldTypes.cpf,
                    hintText: "CPF",
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
        labelText: "Finalizar   R\$ ${total.toStringAsFixed(2)}",
        onPressed: () {

        },
      ),
    );
  }

  Widget _purchaseList() {
    List<Map<String, dynamic>> purchases = [
      {
        "book": "Crítica da razão pura",
        "author": "Immanuel Kant",
        "price": 10.0,
      },
      {
        "book": "Viagem ao centro da Terra",
        "author": "Júlio Verne",
        "price": 7.0,
      },
      {
        "book": "Os três mosqueteiros",
        "author": "Alexandre Dumas",
        "price": 5.99,
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      itemCount: purchases.length,
      separatorBuilder: (context, i) {
        return Divider(color: Colors.black,);
      },
      itemBuilder: (context, i) {
        total += purchases[i]["price"];
        return ListTile(
          title: Text("${purchases[i]["book"]}"),
          subtitle: Text("${purchases[i]["author"]}"),
          trailing: Text("R\$ ${purchases[i]["price"].toStringAsFixed(2)}"),
        );
      },
    );
  }
}