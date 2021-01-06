import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: COMMON_L_GAP,
            ),
            Image.asset("assets/images/insta_text_logo.png"),
            TextField(),
            TextField(),
            TextField(),
          ],
        ));
  }
}
