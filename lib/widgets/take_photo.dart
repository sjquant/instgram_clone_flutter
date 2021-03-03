import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/screen_size.dart';

import 'loding_indicator.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({
    Key key,
  }) : super(key: key);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  CameraController _controller;
  Widget _progress = LodingIndicator();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: availableCameras(),
        builder: (context, snapshot) {
          return Column(
            children: [
              Container(
                  color: Colors.black,
                  width: size.width,
                  height: size.width,
                  child: snapshot.hasData
                      ? _getPreview(snapshot.data)
                      : _progress),
              Expanded(
                child: OutlineButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  borderSide: BorderSide(color: Colors.black12, width: 16),
                ),
              ),
            ],
          );
        });
  }

  Widget _getPreview(List<CameraDescription> cameras) {
    _controller = CameraController(cameras[0], ResolutionPreset.medium);

    return FutureBuilder(
        future: _controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ClipRect(
              child: OverflowBox(
                alignment: Alignment.center,
                child: Container(
                    width: size.width,
                    height: size.width / _controller.value.aspectRatio,
                    child: CameraPreview(_controller)),
              ),
            );
          } else {
            return _progress;
          }
        });
  }
}
