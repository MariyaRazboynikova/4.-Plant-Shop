import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/data/models/product_model.dart';
import 'package:lesoon1/garden_shop/domain/entity/product.dart';
import 'package:lesoon1/garden_shop/domain/repository/plant_repository.dart';

class PlantRepositoryImpl extends ChangeNotifier implements PlantRepository {
  final List<Product> _cart = [];
  final List<Product> _plantsShop = [
    ProductModel(
      name: 'Monstera',
      price: 68,
      category: 'Indoor',
      imagePath: 'lib/assets/monstera.jpg',
      description:
          'The Monstera, often called the Swiss Cheese Plant, is an eye-catching tropical beauty. With its large, glossy leaves featuring unique perforations, it adds a touch of exotic charm to any space. Ideal for indoor environments, this low-maintenance plant thrives in bright, indirect light. Its lush foliage not only purifies the air but also enhances your home decor. Perfect for plant lovers and beginners alike!',
    ),
    ProductModel(
        name: 'Aloe Vera',
        price: 37,
        category: 'Indoor',
        imagePath: 'lib/assets/aloe_vera.jpg',
        description:
            'Aloe Vera is a succulent plant known for its soothing gel, often used in skincare. Its fleshy leaves store water, making it drought-resistant. This easy-to-care-for plant thrives in bright, indirect light, perfect for adding a touch of green to any home or office space.'),
    ProductModel(
        name: 'Snake Plant',
        price: 45,
        category: 'Indoor',
        imagePath: 'lib/assets/snake_plant.jpg',
        description:
            'The Snake Plant, or Sansevieria, features tall, upright leaves with striking patterns. Its a low-maintenance indoor plant that thrives in various light conditions. Known for its air-purifying qualities, its an excellent choice for beginners and enhances any decor with its modern look.'),
    ProductModel(
        name: 'Drakaena',
        price: 127,
        category: 'Outdoor',
        imagePath: 'lib/assets/drakaena.jpg',
        description:
            'Dracaena is a diverse genus of plants known for their striking foliage and architectural form. They require minimal care and thrive in indirect light. With various species, Dracaena adds elegance to any space, making it a popular choice for both homes and workplaces.'),
    ProductModel(
        name: "Fiddle Leaf Fig",
        category: "Indoor",
        imagePath: "lib/assets/Fiddle Leaf Fig.webp",
        price: 30,
        description:
            'The Fiddle Leaf Fig is celebrated for its large, glossy leaves that add a dramatic touch to any room. This trendy indoor plant prefers bright, indirect light and moderate humidity. With proper care, it can grow tall and become a stunning focal point in your decor.'),
    ProductModel(
        name: "Monstera Deliciosa",
        category: "Outdoor",
        imagePath: "lib/assets/Monstera Deliciosa.jpg",
        price: 35,
        description:
            'Monstera Deliciosa, also known as the Swiss Cheese Plant, features unique, split leaves that create an exotic look. This tropical plant thrives in bright, indirect light and enjoys humidity. Its lush foliage makes it a favorite among plant enthusiasts for adding a vibrant touch to interiors.'),
    ProductModel(
        name: "Peace Lily",
        category: "Indoor",
        imagePath: "lib/assets/Peace Lily.webp",
        price: 25,
        description:
            'The Peace Lily is renowned for its elegant white blooms and glossy green leaves. Its an excellent air purifier, thriving in low light and requiring minimal care. This beautiful plant symbolizes peace and tranquility, making it a perfect addition to any home or office space.'),
    ProductModel(
        name: "Rubber Plant",
        category: "Indoor",
        imagePath: "lib/assets/Rubber Plant.jpg",
        price: 28,
        description:
            'The Rubber Plant, or Ficus elastica, boasts large, shiny leaves that range from deep green to burgundy. This hardy plant thrives in bright, indirect light and is known for its air-purifying properties. Its an ideal choice for adding style and life to your indoor environment.'),
    ProductModel(
        name: "Pothos",
        category: "Outdoor",
        imagePath: "lib/assets/Pothos.jpg",
        price: 13,
        description:
            'Pothos is a versatile and resilient vine known for its heart-shaped leaves. This low-maintenance plant thrives in various light conditions and can be easily propagated. Ideal for beginners, Pothos is perfect for hanging baskets or trailing from shelves, adding lush greenery to any space.'),
    ProductModel(
        name: "Bird of Paradise",
        category: "Outdoor",
        imagePath: "lib/assets/Bird of Paradise.jpg",
        price: 50,
        description:
            'The Bird of Paradise plant features striking, banana-like leaves and vibrant flowers resembling a bird in flight. Thriving in bright light, it adds a tropical touch to any indoor or outdoor space. Known for its dramatic appearance, its a stunning centerpiece for plant lovers.'),
    ProductModel(
        name: "ZZ Plant",
        category: "Indoor",
        imagePath: "lib/assets/ZZ Plant.webp",
        price: 23,
        description:
            'The ZZ Plant is known for its glossy, dark green leaves and ability to thrive in low-light conditions. This low-maintenance plant requires minimal watering, making it perfect for busy individuals. Its unique, architectural form adds a modern touch to any room, enhancing your decor effortlessly.'),
    ProductModel(
        name: "Boston Fern",
        category: "Indoor",
        imagePath: "lib/assets/Boston Fern.jpeg",
        price: 19,
        description:
            'Boston Fern is a lush, feathery plant known for its graceful fronds. It thrives in humid environments and indirect light, making it ideal for bathrooms or kitchens. This classic houseplant not only adds beauty but also helps improve air quality, creating a refreshing atmosphere.'),
    ProductModel(
        name: "Cactus",
        category: "Indoor",
        imagePath: "lib/assets/Cactus.jpg",
        price: 10,
        description:
            'Cacti are unique, drought-resistant plants with thick, fleshy stems that store water. Available in various shapes and sizes, they thrive in bright sunlight and require minimal watering. Perfect for beginners, cacti add a touch of desert charm to any home, requiring very little care.'),
    ProductModel(
        name: "Jade Plant",
        category: "Outdoor",
        imagePath: "lib/assets/Jade Plant.jpg",
        price: 17,
        description:
            'The Jade Plant, or Crassula ovata, is a popular succulent known for its thick, oval leaves. Symbolizing prosperity and good luck, it thrives in bright light and requires minimal watering. This hardy plant is perfect for beginners, adding a touch of green to any space.'),
  ];

  @override
  List<Product> get plantsShop => _plantsShop;

  @override
  List<Product> get cart => _cart;

  @override
  void addItemToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  @override
  void removeItemFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

  @override
  void addMultipleItemsToCart(List<Product> items) {
    _cart.addAll(items);
    notifyListeners();
  }
}
