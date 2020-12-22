import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/duration.dart';
import 'package:instagram_clone/widgets/signin_form.dart';
import 'package:instagram_clone/widgets/signup_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Widget _signupForm = SignupForm();
  Widget _signinForm = SigninForm();

  Widget _currentWidget;

  @override
  void initState() {
    if (_currentWidget == null) _currentWidget = _signupForm;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          AnimatedSwitcher(child: _currentWidget, duration: COMMON_DURATION),
          Container(
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    if (_currentWidget is SignupForm) {
                      _currentWidget = _signinForm;
                    } else {
                      _currentWidget = _signupForm;
                    }
                  });
                },
                child: Text("Go to Sign up")),
          ),
        ],
      ),
    ));
  }
}
