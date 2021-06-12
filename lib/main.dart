import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/color.dart';
import 'package:instagram_clone/homepage.dart';
import 'package:instagram_clone/models/firebase_auth_state.dart';
import 'package:instagram_clone/screens/auth.dart';
import 'package:instagram_clone/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAuthState _firebaseAuthState = FirebaseAuthState();
  Widget _currentScreen;
  @override
  Widget build(BuildContext context) {
    _firebaseAuthState.watchAuthChange();
    return ChangeNotifierProvider<FirebaseAuthState>.value(
      value: _firebaseAuthState,
      child: MaterialApp(
        // home: AuthScreen(),
        home: Consumer<FirebaseAuthState>(builder: (BuildContext context,
            FirebaseAuthState firebaseAuthState, Widget child) {
          switch (firebaseAuthState.firebaseAuthStatus) {
            case FirebaseAuthStatus.signout:
              _currentScreen = AuthScreen();
              break;
            case FirebaseAuthStatus.progress:
              _currentScreen = LoadingIndicator();
              break;
            case FirebaseAuthStatus.signin:
              _currentScreen = HomePage();
              break;
            default:
              _currentScreen = LoadingIndicator();
              break;
          }
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: _currentScreen,
          );
        }),
        theme: ThemeData(primarySwatch: white),
      ),
    );
  }
}
