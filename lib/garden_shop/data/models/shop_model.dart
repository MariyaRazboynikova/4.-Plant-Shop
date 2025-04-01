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
      imagePath: "https://example.com/fiddle_leaf_fig.jpg",
      price: 30,
    ),
    ProductModel(
      name: "Snake Plant",
      description: "A hardy plant that requires minimal care.",
      imagePath: "https://example.com/snake_plant.jpg",
      price: 20,
    ),
    ProductModel(
      name: "Monstera Deliciosa",
      description: "A trendy plant with unique split leaves.",
      imagePath: "https://example.com/monstera_deliciosa.jpg",
      price: 35,
    ),
    ProductModel(
      name: "Peace Lily",
      description: "A lovely plant with elegant white flowers.",
      imagePath: "https://example.com/peace_lily.jpg",
      price: 25,
    ),
    ProductModel(
      name: "Aloe Vera",
      description: "A medicinal plant known for its soothing gel.",
      imagePath: "https://example.com/aloe_vera.jpg",
      price: 15,
    ),
    ProductModel(
      name: "Rubber Plant",
      description: "A sturdy plant with thick, glossy leaves.",
      imagePath: "https://example.com/rubber_plant.jpg",
      price: 28,
    ),
    ProductModel(
      name: "Pothos",
      description: "An easy-to-care-for vine plant with heart-shaped leaves.",
      imagePath: "https://example.com/pothos.jpg",
      price: 13,
    ),
    ProductModel(
      name: "Bird of Paradise",
      description: "A striking plant with large, banana-like leaves.",
      imagePath: "https://example.com/bird_of_paradise.jpg",
      price: 50,
    ),
    ProductModel(
      name: "ZZ Plant",
      description: "A low-maintenance plant with shiny, dark green leaves.",
      imagePath: "https://example.com/zz_plant.jpg",
      price: 23,
    ),
    ProductModel(
      name: "Boston Fern",
      description: "A lush, green fern that thrives in humid environments.",
      imagePath: "https://example.com/boston_fern.jpg",
      price: 19,
    ),
    ProductModel(
      name: "Cactus",
      description: "A drought-tolerant plant perfect for beginners.",
      imagePath: "https://example.com/cactus.jpg",
      price: 10,
    ),
    ProductModel(
      name: "Jade Plant",
      description: "A succulent that symbolizes good luck and prosperity.",
      imagePath: "https://example.com/jade_plant.jpg",
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
