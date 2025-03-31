import 'package:flutter/material.dart';
import 'package:lesoon1/theme/theme.dart';

class ThemesProvider extends ChangeNotifier {
  final ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;
}
