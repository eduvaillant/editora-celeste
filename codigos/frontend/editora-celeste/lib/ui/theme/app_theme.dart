import 'package:flutter/material.dart';

class AppTheme {
  static final Color error = Colors.red;
  static final Color pending = Colors.orange;
  static final Color? processing = Colors.yellow[700];
  
  static final MaterialColor myGreen = const MaterialColor(
    0xff12aa4b,
    const {
      50 : const Color(0xFF95FFBE),
      100 : const Color(0xFF4BE285),
      200 : const Color(0xFF49DB81),
      300 : const Color(0xFF31D16E),
      400 : const Color(0xFF1BBD59),
      500 : const Color(0xff12aa4b),
      600 : const Color(0xFF14A049),
      700 : const Color(0xFF0C9942),
      800 : const Color(0xFF0A8B3C),
      900 : const Color(0xFF078638)
    }
  );
  
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: myGreen,
    toggleableActiveColor: Colors.blue,
    unselectedWidgetColor: Colors.blue,
    backgroundColor: Colors.grey[700],
    bottomAppBarColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 5,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    accentColor: Colors.blue,
    secondaryHeaderColor: Colors.grey[300],
    iconTheme: IconThemeData(
      color: Colors.blue
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    accentIconTheme: IconThemeData(
      color: Colors.blue,
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.blue,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.blue,
      ),
      color: Colors.white,
      actionsIconTheme: IconThemeData(
        color: Colors.blue
      ),
      centerTitle: true,
      elevation: 0,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    cardColor: Colors.grey[200],
    primaryTextTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
      ),
      headline6: TextStyle(
        color: Colors.black,
      ),
    ),

    scrollbarTheme: ScrollbarThemeData(
      isAlwaysShown: true,
      mainAxisMargin: 2,
      interactive: true,
      radius: Radius.circular(5),
      crossAxisMargin: 2,
      showTrackOnHover: true
    )
  );

  static final ThemeData darkTheme = ThemeData(
    toggleableActiveColor: Colors.blue,
    unselectedWidgetColor: Colors.blue,
    scaffoldBackgroundColor: Color(0xff1e1e1e),
    primaryColorBrightness: Brightness.dark,
    secondaryHeaderColor: Color(0xff727272),
    bottomAppBarColor: Color(0xff1e1e1e),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      elevation: 5,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed
    ),
    brightness: Brightness.dark,
    iconTheme: IconThemeData(
      color: Colors.blue
    ),
    backgroundColor: Colors.grey[300],
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue
    ),
    accentIconTheme: IconThemeData(
      color: Colors.blue
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.blue
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.blue
      ),
      color: Color(0xff1e1e1e),
      actionsIconTheme: IconThemeData(
        color: Colors.blue
      ),
      centerTitle: true,
      elevation: 0,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white),
      ),
    ),
    cardColor: Color(0xff282828),
    primaryColor: Colors.blue,
    accentColor: Colors.blue,
    primaryTextTheme: TextTheme(
      bodyText1: TextStyle(color: Color(0xffd1d1d1)),
      headline6: TextStyle(color: Color(0xffd1d1d1)),
    ),
    textTheme: TextTheme(
      button: TextStyle(
        color: Colors.white,
      ),
    ),

    scrollbarTheme: ScrollbarThemeData(
      isAlwaysShown: true,
      mainAxisMargin: 2,
      interactive: true,
      radius: Radius.circular(5),
      crossAxisMargin: 2,
      showTrackOnHover: true
    )
  );

  static const Color errorColor = Color.fromARGB(0xFF, 239, 83, 80);

}