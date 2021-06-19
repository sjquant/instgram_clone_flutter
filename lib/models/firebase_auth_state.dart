import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import '../utils.dart';

class FirebaseAuthState extends ChangeNotifier {
  FirebaseAuthStatus _firebaseAuthStatus = FirebaseAuthStatus.signout;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  User _firebaseUser;

  void watchAuthChange() {
    _firebaseAuth.authStateChanges().listen((User firebaseUser) {
      if (_firebaseUser == null && firebaseUser == null) {
        return;
      } else {
        _firebaseUser = firebaseUser;
        changeFirebaseAuthStatus();
      }
    });
  }

  void signup(BuildContext context,
      {@required email, @required password}) async {
    changeFirebaseAuthStatus(FirebaseAuthStatus.progress);
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((error) {
      String message;
      switch (error.code) {
        case 'email-already-in-use':
          message = "이미 사용중인 이메일입니다.";
          break;
        case 'invalid-email':
          message = "잘못된 이메일입니다.";
          break;
        case 'operation-not-allowed':
          message = "허용되지 않는 동작입니다.";
          break;
        case 'weak-password':
          message = "비밀번호가 취약합니다.";
          break;
      }

      simpleSnackbar(context, message);
    });
  }

  void signIn(BuildContext context,
      {@required email, @required password}) async {
    changeFirebaseAuthStatus(FirebaseAuthStatus.progress);
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((error) {
      String message;
      switch (error.code) {
        case 'invalid-email':
          message = "잘못된 이메일입니다.";
          break;
        case 'user-disabled':
          message = "해당 계정은 비활성화 되었습니다.";
          break;
        case 'user-not-found':
          message = "존재하지 않는 사용자입니다.";
          break;
        case 'wrong-password':
          message = "비밀번호가 틀립니다.";
          break;
      }

      SnackBar snackBar = SnackBar(content: Text(message));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  void _handleFacebookTokenWithFirebase(
      BuildContext context, String token) async {
    changeFirebaseAuthStatus(FirebaseAuthStatus.progress);
    final AuthCredential credential = FacebookAuthProvider.credential(token);
    final UserCredential res =
        await _firebaseAuth.signInWithCredential(credential);
    final User user = res.user;

    if (user == null) {
      simpleSnackbar(context, "페이스북 로그인에 문제가 발생했습니다.");
    } else {
      _firebaseUser = user;
    }
    notifyListeners();
  }

  void signInWithFacebook(BuildContext context) async {
    final result = await _facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        _handleFacebookTokenWithFirebase(context, result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        simpleSnackbar(context, "페이스북 로그인을 취소했습니다.");
        break;
      case FacebookLoginStatus.error:
        simpleSnackbar(context, "페이스북 로그인에 문제가 발생헀습니다.");
        break;
    }
  }

  void signOut() async {
    _firebaseAuthStatus = FirebaseAuthStatus.signout;
    if (_firebaseUser != null) {
      _firebaseUser = null;
      _firebaseAuth.signOut();

      if (await _facebookLogin.isLoggedIn) {
        await _facebookLogin.logOut();
      }
    }
    notifyListeners();
  }

  void changeFirebaseAuthStatus([FirebaseAuthStatus firebaseAuthStaus]) {
    if (firebaseAuthStaus != null) {
      _firebaseAuthStatus = firebaseAuthStaus;
    } else {
      if (_firebaseUser != null) {
        _firebaseAuthStatus = FirebaseAuthStatus.signin;
      } else {
        _firebaseAuthStatus = FirebaseAuthStatus.signout;
      }
    }
    print(_firebaseAuthStatus);
    notifyListeners();
  }

  FirebaseAuthStatus get firebaseAuthStatus => _firebaseAuthStatus;
}

enum FirebaseAuthStatus { signout, progress, signin }
