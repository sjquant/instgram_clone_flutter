import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/fade_stack.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int currentStackIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          FadeStack(
            currentStackIndex: currentStackIndex,
          ),
          Container(
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    if (currentStackIndex == 0)
                      currentStackIndex = 1;
                    else
                      currentStackIndex = 0;
                  });
                },
                child: Text("Go to Sign up")),
          ),
        ],
      ),
    ));
  }
}
