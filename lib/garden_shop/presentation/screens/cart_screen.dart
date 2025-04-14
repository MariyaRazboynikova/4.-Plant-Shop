import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/data/models/cart_item.dart';
import 'package:lesoon1/garden_shop/data/repository/plant_repository_impl.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/button.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/text.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<PlantRepositoryImpl>().cart;
    final totalPrice = context.watch<PlantRepositoryImpl>().totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Card',
            style: MyTextStyle.appBarStyle(context),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.payment),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Оплата не реализована')),
              );
            },
          )
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Корзина пуста',
                style: TextStyle(fontSize: 20),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return ListTile(
                          contentPadding: EdgeInsets.all(8.0),
                          title: Text(
                            item.product.name,
                            style: MyTextStyle.normalTextStyle(context),
                          ),
                          subtitle: Text(
                            '\$${item.product.price}',
                            style: MyTextStyle.bodyStyle(context),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  context
                                      .read<PlantRepositoryImpl>()
                                      .updateQuantity(
                                          item.product, item.quantity - 1);
                                },
                              ),
                              Text(
                                item.quantity.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  context
                                      .read<PlantRepositoryImpl>()
                                      .updateQuantity(
                                          item.product, item.quantity + 1);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                                onPressed: () async {
                                  // Показываем диалог подтверждения
                                  final shouldDelete = await showDialog<bool>(
                                    context: context,
                                    builder: (context) =>
                                        _deleteItems(item, context),
                                  );

                                  if (shouldDelete == true) {
                                    context
                                        .read<PlantRepositoryImpl>()
                                        .removeItemFromCart(item.product);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${item.product.name} удален из корзины',
                                        ),
                                      ),
                                    );
                                  }
                                },
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sum:',
                          style: MyTextStyle.normalTextStyle(context),
                        ),
                        Text(
                          ' \$${totalPrice.toStringAsFixed(2)}',
                          style: MyTextStyle.boldTextStyle(context),
                        ),
                        Button(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Оформление заказа')),
                            );
                          },
                          text: 'Оформить заказ',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  AlertDialog _deleteItems(CartItem item, BuildContext context) {
    return AlertDialog(
      title: Text("Удалить товар?"),
      content: Text(
          "Вы уверены, что хотите удалить ${item.product.name} из корзины?"),
      actions: [
        TextButton(
          child: Text("Отмена"),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: Text("Удалить", style: TextStyle(color: Colors.red)),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}
