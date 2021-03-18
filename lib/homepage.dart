import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:instagram_clone/screens/search.dart';
import 'package:instagram_clone/screens/camera.dart';
import 'package:instagram_clone/screens/feed.dart';
import 'package:instagram_clone/screens/profile.dart';

import 'constants/screen_size.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.healing), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
  ];

  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  static List<Widget> _screens = [
    FeedScreen(),
    SearchScreen(),
    Container(color: Colors.greenAccent),
    Container(color: Colors.cyanAccent),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    if (size == null) size = MediaQuery.of(context).size;

    return Scaffold(
        key: _key,
        body: IndexedStack(index: _selectedIndex, children: _screens),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            items: btmNavItems,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black38,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: _selectBtmIcon));
  }

  void _selectBtmIcon(int idx) {
    setState(() {
      switch (idx) {
        case 2:
          _oepnCamera();
          break;
        default:
          _selectedIndex = idx;
      }
    });
  }

  void _oepnCamera() async {
    if (await _checkPermissionGranted()) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CameraScreen()));
    } else {
      SnackBar snackbar = SnackBar(
          content: Text('권한을 허용해주세요.'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              _key.currentState.hideCurrentSnackBar();
              AppSettings.openAppSettings();
            },
          ));
      _key.currentState.showSnackBar(snackbar);
    }
  }

  Future<bool> _checkPermissionGranted() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
      Platform.isIOS ? Permission.photos : Permission.storage
    ].request();

    bool granted = true;
    statuses.forEach((permission, status) {
      if (!status.isGranted) granted = false;
    });
    return granted;
  }
}
