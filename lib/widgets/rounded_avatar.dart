import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';

class RoundedAvatar extends StatelessWidget {
  final double size;

  const RoundedAvatar({
    Key key,
    this.size = AVATAR_SIZE,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
          imageUrl: "https://picsum.photos/100", width: size, height: size),
    );
  }
}
