import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/data/models/product_model.dart';

class ShopModel extends ChangeNotifier {
  final List<ProductModel> _cart = [];
  final List<ProductModel> _plantsShop = [
    ProductModel(
      name: 'Monstera',
      price: 68,
      description: 'Indoor',
      imagePath: 'lib/assets/monstera.jpg',
    ),
    ProductModel(
      name: 'Aloe Vera',
      price: 37,
      description: 'Indoor',
      imagePath: 'lib/assets/aloe_vera.jpg',
    ),
    ProductModel(
      name: 'Snake Plant',
      price: 45,
      description: 'Indoor',
      imagePath: 'lib/assets/snake_plant.jpg',
    ),
    ProductModel(
      name: 'Drakaena',
      price: 127,
      description: 'Outdoor',
      imagePath: 'lib/assets/drakaena.jpg',
    ),
  ];

  List<ProductModel> get plantsShop => _plantsShop;
  List<ProductModel> get cart => _cart;

  //add item to cart
  void addItemToCart(ProductModel item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(ProductModel item) {
    _cart.remove(item);
    notifyListeners();
  }
}
