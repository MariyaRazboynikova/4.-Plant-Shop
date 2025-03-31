import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTile extends StatelessWidget {
  final String text;

  const CategoryTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: GoogleFonts.taiHeritagePro(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
