import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';
import 'package:instagram_clone/models/firebase_auth_state.dart';
import 'package:provider/provider.dart';

class ProfileSideMenu extends StatelessWidget {
  final double menuWidth;

  const ProfileSideMenu(this.menuWidth, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: menuWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(COMMON_GAP),
                child: Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
                onTap: () {
                  Provider.of<FirebaseAuthState>(context, listen: false)
                      .signOut();
                },
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.black87,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: COMMON_GAP),
                title: Text("Signout"))
          ],
        ));
  }
}
