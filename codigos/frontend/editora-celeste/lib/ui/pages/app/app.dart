import 'dart:convert';
import 'package:editora_celeste/app/variaveis.dart';
import 'package:editora_celeste/databases/usuario.dart';
import 'package:editora_celeste/ui/pages/conta/perfil.dart';
import 'package:editora_celeste/ui/pages/escritor/lista_escritor.dart';
import 'package:editora_celeste/ui/pages/livro/lista_livro.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppEditoraCelestePage extends StatefulWidget {
  const AppEditoraCelestePage() : super();

  @override
  _AppEditoraCelestePageState createState() => _AppEditoraCelestePageState();
}

class _AppEditoraCelestePageState extends State<AppEditoraCelestePage> {
  List<MenuItem> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      // MenuItem(
      //   label: "Início",
      //   icon: Icon(EvaIcons.homeOutline),
      //   selectedIcon: Icon(EvaIcons.home),
      // ),
      MenuItem(
        label: "Escritores",
        icon: Icon(EvaIcons.peopleOutline),
        selectedIcon: Icon(EvaIcons.people),
      ),
      MenuItem(
        label: "Livros",
        icon: Icon(EvaIcons.bookOutline),
        selectedIcon: Icon(EvaIcons.book),
      ),
      // MenuItem(
      //   label: "Favoritos",
      //   icon: Icon(EvaIcons.starOutline),
      //   selectedIcon: Icon(EvaIcons.star),
      // ),
      MenuItem(
        label: "Menu",
        icon: Icon(EvaIcons.menu2Outline),
        selectedIcon: Icon(EvaIcons.person),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    mudarVersao(context);
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: appBar(),
          body: body(),
          bottomNavigationBar: bottomNavigationBar(),
        );
      }
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Text(
        "Editora Celeste",
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: menuButton(),
      actions: [
        // contaLogada(context),
      ],
    );
  }

  Widget body() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          appStore.isWeb ? navigationBarWeb() : SizedBox(),
          Expanded(
            child: Observer(
              builder: (context) {
                return IndexedStack(
                  children: <Widget>[
                    // InicioTela(),
                    ListarEscritoresTela(),
                    ListarLivrosTela(),
                    PerfilUsuarioTela(),
                  ],
                  index: appStore.indiceAtual,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNavigationBar() {
    if (appStore.isWeb) {
      return SizedBox();
    } else {
      return BottomNavigationBar(
        currentIndex: appStore.indiceAtual,
        onTap: (int i) {
          appStore.mudarIndex(i);
        },
        items: generateAdapterList(),
      );
    }
  }

  Widget navigationBarWeb() {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Observer(
                builder: (context) {
                  return NavigationRail(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    selectedLabelTextStyle: TextStyle(
                      color: Theme.of(context).appBarTheme.iconTheme!.color,
                    ),
                    minExtendedWidth: 220,
                    extended: appStore.showMenu,
                    onDestinationSelected: (indice) {
                      appStore.setShowMenu(false);
                      appStore.mudarIndex(indice);
                    },
                    selectedIconTheme: IconThemeData(
                      color: Theme.of(context).appBarTheme.iconTheme!.color
                    ),
                    destinations: generateAdapterList(web: true),
                    selectedIndex: appStore.indiceAtual,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget contaLogada(context) {
    return PopupMenuButton(
      tooltip: "Perfil",
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(
            width: 1, 
            color: Theme.of(context).cardColor
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(80)
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              EvaIcons.personOutline,
              color: Theme.of(context).appBarTheme.actionsIconTheme!.color
            ),
            SizedBox(width: 8),
            // Observer(
            //   builder: (context){ 
            //     if(!OwValidate.text(userStore.user!.nome, minLength: 2)) {
            //       return Text("Entrar");
            //     } else {
            //       return Text(
            //         userStore.user!.nome!.split(" ")[0]
            //       );
            //     }
            //   }
            // ),
            SizedBox(width: 5),
            Icon(
              Icons.keyboard_arrow_down, 
              color: Colors.grey, 
              size: 18
            )
          ],
        ),
      ),
      color: Theme.of(context).cardColor,
      itemBuilder: (BuildContext context) {
        return [
          botaoMenuPopUp("Sair", Icon(Icons.logout_outlined), () async {
            await DatabaseUsuario.remover();
            // Navigator.push(context, MaterialPageRoute(builder: (context) => SplashPage()));
          })
        ];
      },
    );
  }

  PopupMenuEntry botaoMenuPopUp(String titulo, icon, onTap) {
    return PopupMenuItem(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        hoverColor: Colors.transparent,
        leading: Container(
          width: 40,
          child: Center(
            child: icon,
          ),
        ),
        title: Text(
          titulo,
        ),
        onTap: onTap
      )
    );
  }

  Widget menuButton() {
    return appStore.isWeb
      ? Padding(
          padding: const EdgeInsets.only(left: 16, top: 3),
          child: Tooltip(
            message: "Menu",
            child: IconButton(
              hoverColor: Color(0xff12aa4b).withOpacity(0.04),
              highlightColor: Color(0xff12aa4b).withOpacity(0.04),
              icon: Icon(Icons.menu),
              onPressed: () {
                appStore.setShowMenu(!appStore.showMenu);
              },
            ),
          ),
        )
      : SizedBox();
  }

  generateAdapterList({web = false}) {
    if (web) {
      List<NavigationRailDestination> menu = [];
      items.forEach((element) {
        menu.add(
          NavigationRailDestination(
            icon: Tooltip(
              child: element.icon,
              message: element.label,
            ),
            label: Text(element.label),
            selectedIcon:
                Tooltip(child: element.selectedIcon, message: element.label),
          ),
        );
      });
      return menu;
    } else {
      List<BottomNavigationBarItem> menu = [];
      items.forEach((element) {
        menu.add(
          BottomNavigationBarItem(
            icon: Tooltip(
              child: element.icon,
              message: element.label,
            ),
            label: element.label,
            activeIcon:
                Tooltip(child: element.selectedIcon, message: element.label),
          ),
        );
      });
      return menu;
    }
  }
}

class MenuItem {
  final String label;
  final Widget icon;
  final Widget? selectedIcon;

  MenuItem({
    required this.label,
    required this.icon,
    this.selectedIcon,
  });

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'icon': icon,
      'selectedIcon': selectedIcon,
    };
  }

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      label: map['label'],
      icon: map['icon'],
      selectedIcon: map['selectedIcon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuItem.fromJson(String source) =>
      MenuItem.fromMap(json.decode(source));

  MenuItem copyWith({
    String? label,
    Widget? icon,
    Widget? selectedIcon,
  }) {
    return MenuItem(
      label: label ?? this.label,
      icon: icon ?? this.icon,
      selectedIcon: selectedIcon ?? this.selectedIcon,
    );
  }

  @override
  String toString() =>
      'MenuItem(label: $label, icon: $icon, selectedIcon: $selectedIcon)';
}

mudarVersao(context) {
  if (MediaQuery.of(context).size.width > 545) {
    if (!appStore.isWeb) {
      appStore.setIsWeb(true);
    }
  } else {
    if (appStore.isWeb) {
      appStore.setIsWeb(false);
    }
  }
}
