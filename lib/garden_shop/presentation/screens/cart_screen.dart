import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/data/repository/plant_repository_impl.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<PlantRepositoryImpl>().cart;
    final totalPrice = context.watch<PlantRepositoryImpl>().totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        actions: [
          IconButton(
            icon: Icon(Icons.payment),
            onPressed: () {
              // Здесь будет логика для оформления оплаты
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
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(item.product.name),
                        subtitle: Text('Цена: \$${item.product.price}'),
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
                            Text(item.quantity.toString()),
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
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                context
                                    .read<PlantRepositoryImpl>()
                                    .removeItemFromCart(item.product);
                              },
                            ),
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
                        'Общая стоимость: \$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Логика для оформления заказа
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Оформление заказа')),
                          );
                        },
                        child: Text('Оформить заказ'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
