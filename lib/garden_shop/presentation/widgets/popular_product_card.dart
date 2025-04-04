import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const PopularProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: 120,
        ),
        Expanded(
          child: Container(
            height: 120,
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: GoogleFonts.taiHeritagePro(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  description,
                  softWrap: true,
                  maxLines: 2,
                  style: GoogleFonts.taiHeritagePro(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
