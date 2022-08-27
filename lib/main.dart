import 'package:flutter/material.dart';
import 'package:rock_paper_seasor_project/main_application.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'vb',
        primarySwatch: Colors.deepOrange,
      ),
      home: MainApplication(),
    );
  }
}
