import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(COMMON_GAP),
      child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: COMMON_L_GAP,
              ),
              Image.asset("assets/images/insta_text_logo.png"),
              TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[200]),
                          borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.grey[100]),
                  validator: (text) {
                    if (text.isNotEmpty && text.contains("@")) {
                      return null;
                    } else {
                      return "정확한 이메일 주소를 입력해주세요.";
                    }
                  }),
              TextFormField(),
              TextFormField(),
            ],
          )),
    );
  }
}
