import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/data/models/product_model.dart';

class PlantRepository extends ChangeNotifier {
  final List<ProductModel> _cart = [];
  final List<ProductModel> _plantsShop = [
    ProductModel(
      name: 'Monstera',
      price: 68,
      category: 'Indoor',
      imagePath: 'lib/assets/monstera.jpg',
    ),
    ProductModel(
      name: 'Aloe Vera',
      price: 37,
      category: 'Indoor',
      imagePath: 'lib/assets/aloe_vera.jpg',
    ),
    ProductModel(
      name: 'Snake Plant',
      price: 45,
      category: 'Indoor',
      imagePath: 'lib/assets/snake_plant.jpg',
    ),
    ProductModel(
      name: 'Drakaena',
      price: 127,
      category: 'Outdoor',
      imagePath: 'lib/assets/drakaena.jpg',
    ),
    ProductModel(
      name: "Fiddle Leaf Fig",
      category: "Indoor",
      imagePath: "lib/assets/Fiddle Leaf Fig.webp",
      price: 30,
    ),
    ProductModel(
      name: "Monstera Deliciosa",
      category: "Outdoor",
      imagePath: "lib/assets/Monstera Deliciosa.jpg",
      price: 35,
    ),
    ProductModel(
      name: "Peace Lily",
      category: "Indoor",
      imagePath: "lib/assets/Peace Lily.webp",
      price: 25,
    ),
    ProductModel(
      name: "Rubber Plant",
      category: "Indoor",
      imagePath: "lib/assets/Rubber Plant.jpg",
      price: 28,
    ),
    ProductModel(
      name: "Pothos",
      category: "Outdoor",
      imagePath: "lib/assets/Pothos.jpg",
      price: 13,
    ),
    ProductModel(
      name: "Bird of Paradise",
      category: "Outdoor",
      imagePath: "lib/assets/Bird of Paradise.jpg",
      price: 50,
    ),
    ProductModel(
      name: "ZZ Plant",
      category: "Indoor",
      imagePath: "lib/assets/ZZ Plant.webp",
      price: 23,
    ),
    ProductModel(
      name: "Boston Fern",
      category: "Indoor",
      imagePath: "lib/assets/Boston Fern.jpeg",
      price: 19,
    ),
    ProductModel(
      name: "Cactus",
      category: "Indoor",
      imagePath: "lib/assets/Cactus.jpg",
      price: 10,
    ),
    ProductModel(
      name: "Jade Plant",
      category: "Outdoor",
      imagePath: "lib/assets/Jade Plant.jpg",
      price: 17,
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
