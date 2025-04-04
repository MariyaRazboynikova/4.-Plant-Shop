import 'package:lesoon1/garden_shop/domain/entity/product.dart';

abstract class PlantRepository {
  List<Product> get plantsShop;
  List<Product> get cart;

  void addItemToCart(Product item);
  void removeItemFromCart(Product item);
  void addMultipleItemsToCart(List<Product> items);
}
