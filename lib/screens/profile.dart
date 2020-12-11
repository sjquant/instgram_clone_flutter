import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appbar(),
            ProfileBody(),
          ],
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
}
