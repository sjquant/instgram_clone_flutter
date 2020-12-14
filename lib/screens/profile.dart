import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/screen_size.dart';
import 'package:instagram_clone/widgets/profile_body.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Duration _duration = Duration(milliseconds: 300);
  bool _isMenuOpened = false;
  double _menuPosition = size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(children: [
          AnimatedContainer(
            child: ProfileBody(
              onMenuChanged: _changeMenu,
            ),
            duration: _duration,
            curve: Curves.fastOutSlowIn,
            transform:
                Matrix4.translationValues(_menuPosition - size.width, 0, 0),
          ),
          Positioned(
              top: 0,
              bottom: 0,
              width: size.width / 2,
              child: AnimatedContainer(
                child: Container(
                  color: Colors.grey[300],
                ),
                duration: _duration,
                transform: Matrix4.translationValues(_menuPosition, 0, 0),
                curve: Curves.fastOutSlowIn,
              ))
        ]));
  }

  void _changeMenu() {
    setState(() {
      _isMenuOpened = !_isMenuOpened;

      if (_isMenuOpened) {
        _menuPosition = size.width / 2;
      } else {
        _menuPosition = size.width;
      }
    });
  }
}
