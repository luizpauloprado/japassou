import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ja_passou/screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Já Passou?',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 185, 230, 1),
        accentColor: Color.fromRGBO(234, 0, 99, 1),
        backgroundColor: Color.fromRGBO(238, 238, 238, 1),
        scaffoldBackgroundColor: Color.fromRGBO(238, 238, 238, 1),
        brightness: Brightness.light,
        dividerTheme: DividerThemeData(
          thickness: 0.3,
        ),
        textTheme: TextTheme(
          subhead: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          subtitle: TextStyle(
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(119, 119, 119, 1),
          ),
          overline: TextStyle(
            fontWeight: FontWeight.w300,
            color: Color.fromRGBO(108, 108, 108, 1),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
