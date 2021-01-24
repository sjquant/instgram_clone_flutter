import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/color.dart';
import 'package:instagram_clone/screens/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthScreen(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
