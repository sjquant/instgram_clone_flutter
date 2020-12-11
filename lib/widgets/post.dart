import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/screen_size.dart';
import 'package:instagram_clone/constants/size.dart';
import 'package:instagram_clone/widgets/comment.dart';
import 'package:instagram_clone/widgets/loding_indicator.dart';
import 'package:instagram_clone/widgets/rounded_avatar.dart';

class Post extends StatelessWidget {
  final int index;

  Post(
    this.index, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postHeader(),
        _postImage(),
        _postActionBtns(),
        _postLikes(),
        _postCaption(),
      ],
    );
  }

  Widget _postActionBtns() {
    return Row(
      children: <Widget>[
        IconButton(
            icon: ImageIcon(
              AssetImage("assets/images/heart_selected.png"),
            ),
            onPressed: null,
            color: Colors.black87),
        IconButton(
            icon: ImageIcon(
              AssetImage("assets/images/comment.png"),
            ),
            onPressed: null,
            color: Colors.black87),
        IconButton(
            icon: ImageIcon(
              AssetImage("assets/images/direct_message.png"),
            ),
            onPressed: null,
            color: Colors.black87),
        Spacer(),
        IconButton(
            icon: ImageIcon(
              AssetImage("assets/images/bookmark.png"),
            ),
            onPressed: null,
            color: Colors.black87),
      ],
    );
  }

  Widget _postHeader() {
    var children2 = [
      Padding(
        padding: const EdgeInsets.all(COMMON_XXS_GAP),
        child: RoundedAvatar(),
      ),
      Expanded(child: Text("username")),
      IconButton(
        icon: Icon(Icons.more_horiz),
        onPressed: null,
      )
    ];
    return Row(
      children: children2,
    );
  }

  Widget _postImage() {
    return CachedNetworkImage(
        imageUrl: "https://picsum.photos/600/600?random=${index + 1}",
        placeholder: (BuildContext context, String url) {
          return LodingIndicator(
            containerSize: size.width,
            progressSize: 80,
          );
        },
        imageBuilder: (
          BuildContext context,
          ImageProvider imageProvider,
        ) {
          return AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ));
        });
  }

  Widget _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: COMMON_GAP),
      child: Text(
        "12000 likes",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _postCaption() {
    return Comment(
        showImage: false,
        username: "sjquant",
        text: "Hello, World. I want to make a lot of money!");
  }
}
