import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/button.dart';

class QuantitySelector extends StatefulWidget {
  final int initialQuantity;
  final ValueChanged<int> onAddToCartPressed;

  const QuantitySelector({
    super.key,
    required this.initialQuantity,
    required this.onAddToCartPressed,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              if (quantity > 1) {
                setState(() => quantity--);
              }
            },
          ),
          Text('$quantity', style: const TextStyle(fontSize: 18)),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => setState(() => quantity++),
          ),
          Button(
            text: 'Добавить в корзину',
            onTap: () => widget.onAddToCartPressed(quantity),
          ),
        ],
      ),
    );
  }
}
