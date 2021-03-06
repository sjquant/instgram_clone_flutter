import 'package:flutter/material.dart';
import 'package:instagram_clone/models/camera_state.dart';
import 'package:instagram_clone/models/gallery_state.dart';
import 'package:instagram_clone/widgets/my_gallery.dart';
import 'package:instagram_clone/widgets/take_photo.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {
  final CameraState _cameraState = CameraState();
  final GalleryState _galleryState = GalleryState();
  @override
  _CameraScreenState createState() {
    _cameraState.getReadyToTakePhoto();
    _galleryState.initProvider();
    return _CameraScreenState();
  }
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 1;
  String _title = "Photo";
  PageController _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    widget._cameraState.dispose();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CameraState>.value(value: widget._cameraState),
        ChangeNotifierProvider<GalleryState>.value(value: widget._galleryState)
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(_title), centerTitle: true),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: <Widget>[
            MyGallery(),
            TakePhoto(),
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
