import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/core/theme/theme.dart';

class ThemesProvider extends ChangeNotifier {
  final ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;
}
