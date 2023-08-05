// import 'package:flutter/material.dart';

// class FontSizeProvider extends ChangeNotifier {
//   double _fontSize = 16.0;

//   double get fontSize => _fontSize;

//   set fontSize(double size) {
//     _fontSize = size;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/repository/font_size_repository.dart';
// import 'package:life_dox_ai/Domain/models/font_size_repository.dart';

class FontSizeProvider extends ChangeNotifier {
  double _fontSize = 16.0;
  final FontSizeRepository _repository = FontSizeRepository();

  double get fontSize => _fontSize;

  FontSizeProvider() {
    _loadFontSize();
  }

  Future<void> _loadFontSize() async {
    _fontSize = await _repository.loadFontSize();
    notifyListeners();
  }

  set fontSize(double size) {
    _fontSize = size;
    _repository.saveFontSize(size);
    notifyListeners();
  }
}
