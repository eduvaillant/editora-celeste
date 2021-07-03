import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:components_venver/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class TestePaginas extends StatefulWidget {
  const TestePaginas({ Key? key }) : super(key: key);

  @override
  _TestePaginasState createState() => _TestePaginasState();
}

class _TestePaginasState extends State<TestePaginas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TESTE"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlatButton(
              onPressed: () {}, 
              child: Text("Início"),
            ),
            FlatButton(
              onPressed: () {}, 
              child: Text("Escritores"),
            ),
            FlatButton(
              onPressed: () {}, 
              child: Text("Início"),
            ),
            // OwButton(
            //   margin: EdgeInsets.only(
            //     top: 20,
            //   ),
            //   labelText: "Inicio",
            //   onPressed: () {}
            // ),
            // OwButton(
            //   margin: EdgeInsets.only(
            //     top: 20,
            //   ),
            //   labelText: "Escritores",
            //   onPressed: () {}
            // ),
            // OwButton(
            //   margin: EdgeInsets.only(
            //     top: 20,
            //   ),
            //   labelText: "Inicio",
            //   onPressed: () {}
            // ),
          ],
        ),
      ),
    );
  }
}