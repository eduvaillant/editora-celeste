import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class ReportPostPage extends StatefulWidget {
  @override
  _ReportPostPageState createState() => _ReportPostPageState();
}

class _ReportPostPageState extends State<ReportPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Denunciar post"),
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
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Text("Mensagem"),
                  OwTextField(
                    fieldType: TextFieldTypes.multiText,
                    hintText: "Mensagem",
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
        labelText: "Denunciar",
        onPressed: () {

        },
      ),
    );
  }
}