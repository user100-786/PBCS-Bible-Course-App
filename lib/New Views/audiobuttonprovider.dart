import 'package:flutter/cupertino.dart';

class AudioButtonProvider extends ChangeNotifier {
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  void toggleAudioButton() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }
}