import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const HeaderWidget(),
              Expanded(
                child: Stack(
                  children: [
                    const MainShapeWidget(),
                    const MainTextWidget(),
                    const SeeMoreButton(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.emoji_nature,
            color: Theme.of(context).colorScheme.primary,
            size: 100,
          ),
          Text(
            'Skeep',
            style: GoogleFonts.taiHeritagePro(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 30,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class MainShapeWidget extends StatelessWidget {
  const MainShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth * 0.8;
        return Stack(
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width / 2),
                  topRight: Radius.circular(width / 2),
                ),
              ),
            ),
            Container(
              width: width * 1.1,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    width: 2, color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width / 2),
                  topRight: Radius.circular(width / 2),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MainTextWidget extends StatelessWidget {
  const MainTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20),
      child: Text(
        'Create Your Own World',
        softWrap: true,
        style: GoogleFonts.taiHeritagePro(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 100,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/shop_screen');
            },
            child: Text(
              'See More',
              softWrap: true,
              style: GoogleFonts.taiHeritagePro(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 40,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_outlined,
            color: Theme.of(context).colorScheme.secondary,
          )
        ],
      ),
    );
  }
}
