import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/screen_size.dart';
import 'package:instagram_clone/models/camera_state.dart';
import 'package:provider/provider.dart';

import 'loding_indicator.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({
    Key key,
  }) : super(key: key);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  Widget _progress = LodingIndicator();

  @override
  Widget build(BuildContext context) {
    return Consumer<CameraState>(
        builder: (BuildContext context, CameraState cameraState, Widget child) {
      return Column(
        children: [
          Container(
              color: Colors.black,
              width: size.width,
              height: size.width,
              child:
                  cameraState.isReady ? _getPreview(cameraState) : _progress),
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

  Widget _getPreview(CameraState cameraState) {
    return ClipRect(
      child: OverflowBox(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
              width: size.width,
              height: size.width * cameraState.controller.value.aspectRatio,
              child: CameraPreview(cameraState.controller)),
        ),
      ),
    );
  }
}
