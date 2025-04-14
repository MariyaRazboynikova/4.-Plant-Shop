import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/button.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/text.dart';

class CartTotalSection extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onCheckout;

  const CartTotalSection({
    super.key,
    required this.totalPrice,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Sum:', style: MyTextStyle.normalTextStyle(context)),
          Text('\$${totalPrice.toStringAsFixed(2)}',
              style: MyTextStyle.boldTextStyle(context)),
          Button(
            onTap: onCheckout,
            text: 'Оформить заказ',
          ),
        ],
      ),
    );
  }
}
