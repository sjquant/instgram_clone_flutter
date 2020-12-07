import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_appbar(), _username()],
        ));
  }

  Widget _appbar() {
    return SafeArea(
      child: Row(
        children: [
          SizedBox(width: 48),
          Expanded(
            child: Text(
              "SJQuant",
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(icon: Icon(Icons.more_horiz), onPressed: null)
        ],
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: COMMON_GAP),
      child: Text(
        "Seonu Jang",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
