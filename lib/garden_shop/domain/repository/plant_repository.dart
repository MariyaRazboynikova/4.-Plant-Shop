import 'package:lesoon1/garden_shop/data/models/cart_item.dart';
import 'package:lesoon1/garden_shop/domain/entity/product.dart';

abstract class PlantRepository {
  void addItemToCart(Product product, int quantity);
  void removeItemFromCart(Product product);
  void updateQuantity(Product product, int quantity);
  List<CartItem> get cart;
  double get totalPrice;
}
