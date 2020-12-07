import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/post.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Don't show the leading button
          title: Text(
            "Instagram",
            style: TextStyle(fontFamily: "VeganStyle"),
          ),
        ),
        body: ListView.builder(
          itemBuilder: buildList,
          itemCount: 30,
        ));
  }

  Widget buildList(BuildContext context, int index) {
    return Post(index);
  }
}
