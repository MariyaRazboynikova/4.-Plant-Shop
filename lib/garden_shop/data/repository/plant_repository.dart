import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/data/models/product_model.dart';

class PlantRepository extends ChangeNotifier {
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
    ProductModel(
      name: "Fiddle Leaf Fig",
      description: "A beautiful indoor plant with large leaves.",
      imagePath: "lib/assets/Fiddle Leaf Fig.webp",
      price: 30,
    ),
    ProductModel(
      name: "Monstera Deliciosa",
      description: "A trendy plant with unique split leaves.",
      imagePath: "lib/assets/Monstera Deliciosa.jpg",
      price: 35,
    ),
    ProductModel(
      name: "Peace Lily",
      description: "A lovely plant with elegant white flowers.",
      imagePath: "lib/assets/Peace Lily.webp",
      price: 25,
    ),
    ProductModel(
      name: "Rubber Plant",
      description: "A sturdy plant with thick, glossy leaves.",
      imagePath: "lib/assets/Rubber Plant.jpg",
      price: 28,
    ),
    ProductModel(
      name: "Pothos",
      description: "An easy-to-care-for vine plant with heart-shaped leaves.",
      imagePath: "lib/assets/Pothos.jpg",
      price: 13,
    ),
    ProductModel(
      name: "Bird of Paradise",
      description: "A striking plant with large, banana-like leaves.",
      imagePath: "lib/assets/Bird of Paradise.jpg",
      price: 50,
    ),
    ProductModel(
      name: "ZZ Plant",
      description: "A low-maintenance plant with shiny, dark green leaves.",
      imagePath: "lib/assets/ZZ Plant.webp",
      price: 23,
    ),
    ProductModel(
      name: "Boston Fern",
      description: "A lush, green fern that thrives in humid environments.",
      imagePath: "lib/assets/Boston Fern.jpeg",
      price: 19,
    ),
    ProductModel(
      name: "Cactus",
      description: "A drought-tolerant plant perfect for beginners.",
      imagePath: "lib/assets/Cactus.jpg",
      price: 10,
    ),
    ProductModel(
      name: "Jade Plant",
      description: "A succulent that symbolizes good luck and prosperity.",
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
