import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class InsertPostPage extends StatefulWidget {
  @override
  _InsertPostPageState createState() => _InsertPostPageState();
}

class _InsertPostPageState extends State<InsertPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inserir post"),
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
                  Text("Descrição"),
                  OwTextField(
                    fieldType: TextFieldTypes.multiText,
                    hintText: "Descrição",
                    minLines: 2,
                    maxLines: 2,
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
        labelText: "Inserir",
        onPressed: () {

        },
      ),
    );
  }
}