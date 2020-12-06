import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/color.dart';
import 'package:instagram_clone/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
