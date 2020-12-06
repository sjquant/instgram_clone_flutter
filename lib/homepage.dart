import 'package:flutter/material.dart';
import 'package:instagram_clone/feed.dart';

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
    BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: ""),
  ];

  int _selectedIndex = 0;

  static List<Widget> _screens = [
    FeedScreen(),
    Container(color: Colors.blueAccent),
    Container(color: Colors.greenAccent),
    Container(color: Colors.cyanAccent),
    Container(color: Colors.redAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  void _selectBtmIcon(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
