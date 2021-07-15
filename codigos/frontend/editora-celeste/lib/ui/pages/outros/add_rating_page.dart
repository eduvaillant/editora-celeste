import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class AddRatingPage extends StatefulWidget {
  @override
  _AddRatingPageState createState() => _AddRatingPageState();
}

class _AddRatingPageState extends State<AddRatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avaliar"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Avalie-nos",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5, 
                  (index) => _star(),
                ).toList(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nome do livro"),
                OwDropdown(
                  hintText: "Nome do livro",
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Text("Mensagem"),
                OwTextField(
                  hintText: "Deixe-nos uma mensagem",
                  minLines: 4,
                  maxLines: 4,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: OwButton(
        margin: EdgeInsets.all(8),
        labelText: "Avaliar",
        onPressed: () {
          
        },
      ),
    );
  }

  Widget _star() {
    return Icon(Icons.star_border, size: 50, color: Colors.yellow,);
  }
}