import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();
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
                  decoration: _decorateInput("Email"),
                  validator: (text) {
                    if (text.isNotEmpty && text.contains("@")) {
                      return null;
                    } else {
                      return "정확한 이메일 주소를 입력해주세요.";
                    }
                  }),
              SizedBox(height: COMMON_GAP),
              TextFormField(
                  controller: _emailController,
                  decoration: _decorateInput("Password"),
                  validator: (text) {
                    if (text.isNotEmpty && text.length > 7) {
                      return null;
                    } else {
                      return "정확한 비밀번호를 입력해주세요.";
                    }
                  }),
              SizedBox(height: COMMON_GAP),
              TextFormField(
                  controller: _emailController,
                  decoration: _decorateInput("Confirm Password"),
                  validator: (text) {
                    if (text.isNotEmpty && text == _pwController.text) {
                      return null;
                    } else {
                      return "비밀번호가 일치하지 않습니다.";
                    }
                  }),
            ],
          )),
    );
  }

  InputDecoration _decorateInput(String hint) {
    return InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey[100]);
  }
}
