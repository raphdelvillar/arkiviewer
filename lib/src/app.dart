import 'package:flutter/material.dart';
import 'ui/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[600],
        fontFamily: 'Monserrat'
      ),
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}
