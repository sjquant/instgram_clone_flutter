import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirebaseAuthState extends ChangeNotifier {
  FirebaseAuthStatus _firebaseAuthStatus = FirebaseAuthStatus.signout;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User _firebaseUser;

  void watchAuthChange() {
    _firebaseAuth.authStateChanges().listen((User firebaseUser) {
      print(firebaseUser);
      if (_firebaseUser == null && firebaseUser == null) {
        return;
      } else {
        _firebaseUser = firebaseUser;
        changeFirebaseAuthStatus();
      }
    });
  }

  void signup(BuildContext context, {@required email, @required password}) {
    _firebaseAuth
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

      SnackBar snackBar = SnackBar(content: Text(message));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  void signIn(BuildContext context, {@required email, @required password}) {
    print("$email, $password");
    _firebaseAuth
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

  void signOut() {
    _firebaseAuthStatus = FirebaseAuthStatus.signout;
    if (_firebaseUser != null) {
      _firebaseUser = null;
      _firebaseAuth.signOut();
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
