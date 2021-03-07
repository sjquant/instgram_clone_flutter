import 'dart:io';

import 'package:flutter/material.dart';

class SharePostScreen extends StatelessWidget {
  final String imagePath;

  const SharePostScreen(this.imagePath, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.file(File(this.imagePath));
  }
}
