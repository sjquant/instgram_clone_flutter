import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/screen_size.dart';
import 'package:instagram_clone/constants/size.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    Key key,
  }) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagesPageMargin = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          _username(),
          _userbio(),
          _profileEditBtn(),
          _tabBtns(),
          _animatedLine()
        ])),
        _imagesPager()
      ]),
    );
  }

  Widget _imagesPager() {
    return SliverToBoxAdapter(
        child: Stack(children: [
      _leftImagesPager(),
      _rightImagesPager(),
    ]));
  }

  AnimatedContainer _rightImagesPager() {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform:
            Matrix4.translationValues(_leftImagesPageMargin + size.width, 0, 0),
        curve: Curves.fastOutSlowIn,
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio: 1.0,
          children: List.generate(
              30,
              (index) => CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://picsum.photos/100/100?random=${index + 31}")),
        ));
  }

  AnimatedContainer _leftImagesPager() {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: Matrix4.translationValues(_leftImagesPageMargin, 0, 0),
        curve: Curves.fastOutSlowIn,
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio: 1.0,
          children: List.generate(
              30,
              (index) => CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://picsum.photos/100/100?random=${index + 1}")),
        ));
  }

  Widget _animatedLine() {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        alignment: _selectedTab == SelectedTab.left
            ? Alignment.centerLeft
            : Alignment.centerRight,
        curve: Curves.fastOutSlowIn,
        child: Container(
          width: size.width / 2,
          height: 1,
          color: Colors.black87,
        ));
  }

  Row _tabBtns() {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            icon: ImageIcon(AssetImage("assets/images/grid.png"),
                color: _selectedTab == SelectedTab.left
                    ? Colors.black
                    : Colors.black26),
            onPressed: () {
              _tabSelected(SelectedTab.left);
            },
          ),
        ),
        Expanded(
          child: IconButton(
              icon: ImageIcon(
                  AssetImage(
                    "assets/images/saved.png",
                  ),
                  color: _selectedTab == SelectedTab.left
                      ? Colors.black26
                      : Colors.black),
              onPressed: () {
                _tabSelected(SelectedTab.right);
              }),
        )
      ],
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
      padding: const EdgeInsets.symmetric(
          horizontal: COMMON_GAP, vertical: COMMON_XXS_GAP),
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

  _tabSelected(SelectedTab selectedTab) {
    setState(() {
      switch (selectedTab) {
        case SelectedTab.left:
          _selectedTab = SelectedTab.left;
          _leftImagesPageMargin = 0;
          break;
        case SelectedTab.right:
          _selectedTab = SelectedTab.right;
          _leftImagesPageMargin = -size.width;
          break;
      }
    });
  }
}

enum SelectedTab { left, right }
