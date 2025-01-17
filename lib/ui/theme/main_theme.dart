import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData get light => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.white10),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(iconSize: WidgetStatePropertyAll(32)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
          backgroundColor: WidgetStatePropertyAll(Colors.orange),
        )),
        textTheme: TextTheme(),
      );
}
