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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
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
                    controller: _pwController,
                    obscureText: true,
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
                    controller: _cpwController,
                    obscureText: true,
                    decoration: _decorateInput("Confirm Password"),
                    validator: (text) {
                      if (text.isNotEmpty && text == _pwController.text) {
                        return null;
                      } else {
                        return "비밀번호가 일치하지 않습니다.";
                      }
                    }),
                SizedBox(height: COMMON_GAP),
                FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print("Validation Success!!");
                    }
                  },
                  child: Text(
                    "Join",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                )
              ],
            )),
      ),
    );
  }

  InputDecoration _decorateInput(String hint) {
    return InputDecoration(
        hintText: hint,
        focusedBorder: _inputBorder(Colors.grey[200]),
        enabledBorder: _inputBorder(Colors.grey[200]),
        errorBorder: _inputBorder(Colors.red[200]),
        focusedErrorBorder: _inputBorder(Colors.red[200]),
        filled: true,
        fillColor: Colors.grey[100]);
  }

  OutlineInputBorder _inputBorder(Color color) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(8));
  }
}
