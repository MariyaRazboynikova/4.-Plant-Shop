import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/text.dart';

class CategoryTile extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CategoryTile({
    super.key,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
      ),
      child: Text(
        text,
        style: MyTextStyle.bodyStyle(context),
      ),
    );
  }
}
