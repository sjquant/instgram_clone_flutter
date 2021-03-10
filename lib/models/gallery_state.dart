import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:local_image_provider/local_image.dart';
import 'package:local_image_provider/local_image_provider.dart';

class GalleryState extends ChangeNotifier {
  LocalImageProvider _localImageProvider;
  bool _hasPermission;
  List<LocalImage> _images;

  Future<bool> initProvider() async {
    _localImageProvider = LocalImageProvider();
    bool _hasPermission = await _localImageProvider.initialize();

    if (_hasPermission) {
      _images = await _localImageProvider.findLatest(30);
      return true;
    } else {
      return false;
    }
  }

  LocalImageProvider get localImageProvider => _localImageProvider;
  bool get hasPermission => _hasPermission;
  List<LocalImage> get images => _images;
}
