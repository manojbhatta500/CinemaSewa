import 'package:cinemasewa/screens/home.dart';
import 'package:cinemasewa/screens/intro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/intro',
      routes: {'/intro': (context) => Intro(), '/home': (context) => Home()},
    );
  }
}
