import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/text.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const InfoCard(
      {super.key,
      required this.icon,
      required this.value,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.green),
        const SizedBox(height: 5),
        Text(value,
            style: const TextStyle(
              fontSize: 16,
            )),
        Text(
          label,
          style: MyTextStyle.bodyStyle(context),
        ),
      ],
    );
  }
}
