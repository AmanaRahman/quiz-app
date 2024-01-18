import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: QuizHomePage(),
            debugShowCheckedModeBanner: false,

    );
  }
}
