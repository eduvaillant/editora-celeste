import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class ChapterRegistrationPage extends StatefulWidget {
  @override
  _ChapterRegistrationPageState createState() => _ChapterRegistrationPageState();
}

class _ChapterRegistrationPageState extends State<ChapterRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro do capítulo"),
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
                  Text("Nome do livro"),
                  OwDropdown(
                    hintText: "Nome do livro",
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Text("Resumo"),
                  OwTextField(
                    fieldType: TextFieldTypes.multiText,
                    hintText: "Resumo",
                    margin: EdgeInsets.only(bottom: 10),
                    minLines: 3,
                    maxLines: 3,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: OwDropdown(
                            hintText: "N° da página",
                            optionsList: ["1", "2"],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.black)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                SizedBox(width: 5,),
                                Text("Nova página"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Capítulo"),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.black)
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(child: Icon(Icons.format_bold)),
                              Expanded(child: Icon(Icons.format_italic)),
                              Expanded(child: Icon(Icons.format_underline)),
                              Container(width: 1, color: Colors.black,),
                              Expanded(child: Icon(Icons.format_align_left)),
                              Expanded(child: Icon(Icons.format_align_center)),
                              Expanded(child: Icon(Icons.format_indent_decrease)),
                              Container(width: 1, color: Colors.black,),
                              Expanded(child: Icon(Icons.link)),
                            ],
                          ),
                        ),
                        OwTextField(
                          fieldType: TextFieldTypes.multiText,
                          minLines: 12,
                          maxLines: 12,
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
}