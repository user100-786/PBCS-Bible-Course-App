import 'package:shared_preferences/shared_preferences.dart';

class FontSizeRepository {
  final String _fontSizeKey = 'font_size_key';

  Future<double> loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_fontSizeKey) ??
        16.0; // Default font size is 16.0 if not found
  }

  Future<void> saveFontSize(double size) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontSizeKey, size);
  }
}
