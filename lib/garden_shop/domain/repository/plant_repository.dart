import 'package:lesoon1/garden_shop/data/models/cart_item.dart';
import 'package:lesoon1/garden_shop/domain/entity/product.dart';

abstract class PlantRepository {
  // Добавить товар в корзину
  void addItemToCart(Product product, int quantity);

  // Удалить товар из корзины
  void removeItemFromCart(Product product);

  // Обновить количество товара в корзине
  void updateQuantity(Product product, int quantity);

  // Получить список товаров в корзине
  List<CartItem> get cart;

  // Подсчитать общую стоимость корзины
  double get totalPrice;
}
