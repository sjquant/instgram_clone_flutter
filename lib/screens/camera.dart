import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 1;
  String _title = "Gallery";
  PageController _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var items2 = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.radio_button_checked), label: "GALLERY"),
      BottomNavigationBarItem(
          icon: Icon(Icons.radio_button_checked), label: "PHOTO"),
      BottomNavigationBarItem(
          icon: Icon(Icons.radio_button_checked), label: "VIDEO"),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(_title), centerTitle: true),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          Container(color: Colors.cyanAccent),
          Container(color: Colors.amberAccent),
          Container(color: Colors.greenAccent)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: items2,
        onTap: _changePage,
      ),
    );
  }

  void _onPageChanged(index) {
    setState(() {
      _currentIndex = index;
      switch (_currentIndex) {
        case 0:
          _title = "Gallery";
          break;
        case 1:
          _title = "Photo";
          break;
        case 2:
          _title = "Video";
          break;
      }
    });
  }

  void _changePage(index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
    });
  }
}
