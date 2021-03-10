import 'package:flutter/material.dart';
import 'package:instagram_clone/models/gallery_state.dart';
import 'package:instagram_clone/screens/share_post.dart';
import 'package:local_image_provider/device_image.dart';
import 'package:provider/provider.dart';

class MyGallery extends StatefulWidget {
  @override
  _MyGalleryState createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryState>(
      builder: (context, galleryState, child) {
        return GridView.count(
            crossAxisCount: 3,
            children: galleryState.images
                .map((localImage) => InkWell(
                      onTap: () async {
                        var image = Image(image: DeviceImage(localImage));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SharePostScreen(
                                  image,
                                )));
                      },
                      child: Image(
                          image: DeviceImage(localImage,
                              scale: 0.2, compression: 50),
                          fit: BoxFit.cover),
                    ))
                .toList());
      },
    );
  }
}
