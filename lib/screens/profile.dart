import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appbar(),
            Expanded(
              child: CustomScrollView(slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  _username(),
                  _userbio(),
                  _profileEditBtn(),
                ]))
              ]),
            ),
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

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: COMMON_GAP),
      child: Text(
        "Seonu Jang",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _userbio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: COMMON_GAP),
      child: Text(
        "I earn what I believe!!!",
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _profileEditBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: COMMON_GAP),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
            onPressed: null,
            borderSide: BorderSide(color: Colors.black45),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: Text("Edit Profile",
                style: TextStyle(fontWeight: FontWeight.bold))),
      ),
    );
  }
}
