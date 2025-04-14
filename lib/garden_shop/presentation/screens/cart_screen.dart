import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/data/models/cart_item.dart';
import 'package:lesoon1/garden_shop/data/repository/plant_repository_impl.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/cart_item_tile.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/cart_total_section.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/text.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = context.watch<PlantRepositoryImpl>();
    final cartItems = repository.cart;
    final totalPrice = repository.totalPrice;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: cartItems.isEmpty
          ? _buildEmptyCartState()
          : _buildCartContent(context, cartItems, totalPrice, repository),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title:
          Center(child: Text('Cart', style: MyTextStyle.appBarStyle(context))),
      actions: [
        IconButton(
          icon: const Icon(Icons.payment),
          onPressed: () => _showNotImplementedSnackBar(context),
        )
      ],
    );
  }

  Widget _buildEmptyCartState() {
    return Center(
      child: Text('Корзина пуста', style: TextStyle(fontSize: 20)),
    );
  }

  Widget _buildCartContent(
    BuildContext context,
    List<CartItem> cartItems,
    double totalPrice,
    PlantRepositoryImpl repository,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(child: _buildCartItemsList(context, cartItems, repository)),
          CartTotalSection(
            totalPrice: totalPrice,
            onCheckout: () => _showCheckoutSnackBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemsList(
    BuildContext context,
    List<CartItem> cartItems,
    PlantRepositoryImpl repository,
  ) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return CartItemTile(
          item: item,
          onDelete: () => _handleDeleteItem(context, item, repository),
          onIncrease: () =>
              repository.updateQuantity(item.product, item.quantity + 1),
          onDecrease: () =>
              repository.updateQuantity(item.product, item.quantity - 1),
        );
      },
    );
  }

  Future<void> _handleDeleteItem(
    BuildContext context,
    CartItem item,
    PlantRepositoryImpl repository,
  ) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => _buildDeleteConfirmationDialog(context, item),
    );

    if (shouldDelete == true) {
      repository.removeItemFromCart(item.product);
      _showDeleteSnackBar(context, item.product.name);
    }
  }

  AlertDialog _buildDeleteConfirmationDialog(
      BuildContext context, CartItem item) {
    return AlertDialog(
      title: const Text("Удалить товар?"),
      content: Text(
          "Вы уверены, что хотите удалить ${item.product.name} из корзины?"),
      actions: [
        TextButton(
          child: const Text("Отмена"),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: const Text("Удалить", style: TextStyle(color: Colors.red)),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }

  void _showNotImplementedSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Оплата не реализована')),
    );
  }

  void _showCheckoutSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Оформление заказа')),
    );
  }

  void _showDeleteSnackBar(BuildContext context, String productName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$productName удален из корзины')),
    );
  }
}
