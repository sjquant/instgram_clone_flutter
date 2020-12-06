import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';
import 'package:instagram_clone/widgets/rounded_avatar.dart';

class Comment extends StatelessWidget {
  final bool showImage;
  final String username;
  final String text;
  final DateTime datetime;

  const Comment({
    Key key,
    this.showImage = true,
    @required this.username,
    @required this.text,
    this.datetime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: COMMON_GAP, vertical: COMMON_XXS_GAP),
      child: Row(
        children: [
          if (showImage) RoundedAvatar(size: 24),
          if (showImage)
            SizedBox(
              width: COMMON_XXS_GAP,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: username, style: TextStyle(color: Colors.black87)),
                TextSpan(text: "    "),
                TextSpan(text: text, style: TextStyle(color: Colors.black87))
              ])),
              if (datetime != null)
                Padding(
                  padding: const EdgeInsets.only(top: COMMON_XXS_GAP),
                  child: Text(
                    datetime.toIso8601String(),
                    style: TextStyle(color: Colors.grey[400], fontSize: 10),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
