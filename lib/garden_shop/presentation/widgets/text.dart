import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyle {
  static TextStyle headerStyle(BuildContext context) {
    return GoogleFonts.taiHeritagePro(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 100,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle subHeaderStyle(BuildContext context) {
    return GoogleFonts.taiHeritagePro(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 40,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle appBarStyle(BuildContext context) {
    return GoogleFonts.taiHeritagePro(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 30,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle boldTextStyle(BuildContext context) {
    return GoogleFonts.taiHeritagePro(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle normalTextStyle(BuildContext context) {
    return GoogleFonts.taiHeritagePro(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 20,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle bodyStyle(BuildContext context) {
    return GoogleFonts.taiHeritagePro(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 18,
      fontWeight: FontWeight.w300,
    );
  }
}
