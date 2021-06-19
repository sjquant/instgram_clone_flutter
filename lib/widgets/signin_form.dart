import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';
import 'package:instagram_clone/models/firebase_auth_state.dart';
import 'package:provider/provider.dart';

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
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
                _emailInput(),
                SizedBox(height: COMMON_GAP),
                _passwordInput(),
                FlatButton(
                    onPressed: () {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Forgotton Password?",
                          style: TextStyle(color: Colors.blue)),
                    )),
                _joinButton(),
                SizedBox(height: COMMON_GAP),
                _orDivider(),
                SizedBox(height: COMMON_GAP),
                _facebookBtn()
              ],
            )),
      ),
    );
  }

  FlatButton _facebookBtn() {
    return FlatButton.icon(
        textColor: Colors.blue,
        onPressed: () {
          Provider.of<FirebaseAuthState>(context, listen: false)
              .signInWithFacebook(context);
        },
        icon: ImageIcon(AssetImage("assets/images/facebook.png")),
        label: Text("Login with Facebook"));
  }

  Stack _orDivider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: Colors.grey[300], height: 1),
        Container(color: Colors.grey[50], width: 60, height: 3),
        Text(
          "OR",
          style: TextStyle(color: Colors.grey[500]),
        )
      ],
    );
  }

  TextFormField _passwordInput() {
    return TextFormField(
        controller: _pwController,
        obscureText: true,
        decoration: _decorateInput("Password"),
        validator: (text) {
          if (text.isNotEmpty && text.length > 7) {
            return null;
          } else {
            return "8자리 이상의 비밀번호를 입력해주세요.";
          }
        });
  }

  TextFormField _emailInput() {
    return TextFormField(
        controller: _emailController,
        decoration: _decorateInput("Email"),
        validator: (text) {
          if (text.isNotEmpty && text.contains("@")) {
            return null;
          } else {
            return "정확한 이메일 주소를 입력해주세요.";
          }
        });
  }

  FlatButton _joinButton() {
    return FlatButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          Provider.of<FirebaseAuthState>(context, listen: false).signIn(context,
              email: _emailController.text.trim(),
              password: _pwController.text.trim());
        }
      },
      child: Text(
        "Sign In",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
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
