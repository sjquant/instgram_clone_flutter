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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              FadeStack(
                currentStackIndex: currentStackIndex,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 40,
                child: Container(
                  color: Colors.white,
                  child: FlatButton(
                    shape: Border(top: BorderSide(color: Colors.grey[300])),
                    onPressed: () {
                      setState(() {
                        if (currentStackIndex == 0)
                          currentStackIndex = 1;
                        else
                          currentStackIndex = 0;
                      });
                    },
                    child: RichText(
                        text: TextSpan(
                            text: (currentStackIndex == 1)
                                ? "Already have an account?  "
                                : "Don't you have an account?  ",
                            style: TextStyle(color: Colors.grey),
                            children: [
                          TextSpan(
                              text: (currentStackIndex == 1)
                                  ? "Sign In"
                                  : "Sgin up",
                              style: TextStyle(color: Colors.blue))
                        ])),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
