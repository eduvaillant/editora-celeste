import 'package:editora_celeste/store/app.dart';
import 'package:editora_celeste/store/users/users_store.dart';
import 'package:editora_celeste/ui/pages/app/app.dart';
import 'package:editora_celeste/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:components_venver/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    GetIt getIt = GetIt.I;
    getIt.registerSingleton<AppStore>(AppStore());
    getIt.registerSingleton<UsersStore>(UsersStore());
  } catch(e) {}
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editora Celeste',
      theme: AppTheme.lightTheme,
      // home: TestePaginas(),
      home: AppEditoraCelestePage(),
      builder: ComponentsInit(
        webWidth: 500,
        isWeb: true,
        hidePrint: false
      ),
      navigatorKey: navigatorGlobalKey,
      navigatorObservers: [botToastNavigatorObserver],
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
        title: Text("Editora Celeste"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OwButton(
              margin: EdgeInsets.only(
                top: 20,
              ),
              labelText: "App",
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)
                    => AppEditoraCelestePage(),
                  ),
                );
              }
            ),
            OwButton(
              margin: EdgeInsets.only(
                top: 20,
              ),
              labelText: "Inicio",
              onPressed: () {}
            ),
            OwButton(
              margin: EdgeInsets.only(
                top: 20,
              ),
              labelText: "Escritores",
              onPressed: () {}
            ),
            OwButton(
              margin: EdgeInsets.only(
                top: 20,
              ),
              labelText: "Inicio",
              onPressed: () {}
            ),
          ],
        ),
      ),
    );
  }
}