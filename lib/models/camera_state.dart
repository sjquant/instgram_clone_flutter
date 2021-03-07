import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

class CameraState extends ChangeNotifier {
  CameraController _cameraController;
  CameraDescription _cameraDescription;
  bool _readyTakePhoto = false;

  void dispose() async {
    if (_cameraController != null) await _cameraController.dispose();
    _cameraController = null;
    _cameraDescription = null;
    _readyTakePhoto = null;
    super.dispose();
  }

  void getReadyToTakePhoto() async {
    List<CameraDescription> cameras = await availableCameras();

    if (cameras != null && cameras.isNotEmpty) {
      setCameraDescription(cameras[0]);
    }

    bool init = false;
    while (!init) {
      init = await initialize();
    }
    _readyTakePhoto = init;
    notifyListeners();
  }

  void setCameraDescription(CameraDescription cameraDescription) async {
    _cameraDescription = cameraDescription;
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.medium);
  }

  Future<bool> initialize() async {
    try {
      await _cameraController.initialize();
      return true;
    } catch (e) {
      return false;
    }
  }

  CameraController get controller => _cameraController;
  CameraDescription get description => _cameraDescription;
  bool get isReady => _readyTakePhoto;
}
