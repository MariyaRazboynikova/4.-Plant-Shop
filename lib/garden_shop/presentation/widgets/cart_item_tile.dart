import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/data/models/cart_item.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/text.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final VoidCallback onDelete;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final totalPrice = item.product.price * item.quantity;

    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      title:
          Text(item.product.name, style: MyTextStyle.normalTextStyle(context)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' \$${totalPrice.toStringAsFixed(2)}',
            style: MyTextStyle.normalTextStyle(context),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildQuantityControls(context),
          _buildDeleteButton(context),
        ],
      ),
    );
  }

  Widget _buildQuantityControls(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: onDecrease,
        ),
        Text(item.quantity.toString(), style: const TextStyle(fontSize: 20)),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: onIncrease,
        ),
      ],
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_outline, color: Colors.red),
      onPressed: onDelete,
    );
  }
}
