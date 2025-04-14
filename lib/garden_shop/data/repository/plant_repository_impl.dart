import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/data/data_sources/local_plant_data_source.dart';
import 'package:lesoon1/garden_shop/data/models/cart_item.dart';
import 'package:lesoon1/garden_shop/domain/entity/product.dart';
import 'package:lesoon1/garden_shop/domain/repository/plant_repository.dart';

class PlantRepositoryImpl extends ChangeNotifier implements PlantRepository {
  final LocalPlantDataSource _dataSource;
  final List<CartItem> _cart = [];
  PlantRepositoryImpl(this._dataSource);

  List<Product> get plantsShop => _dataSource.getPlants();

  @override
  List<CartItem> get cart => _cart;

  @override
  double get totalPrice {
    return _cart.fold(
      0.0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  @override
  void addItemToCart(Product product, int quantity) {
    final existingItem = _cart.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity += quantity;
    } else {
      _cart.add(CartItem(product: product, quantity: quantity));
    }

    notifyListeners();
  }

  @override
  void removeItemFromCart(Product product) {
    _cart.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  @override
  void updateQuantity(Product product, int quantity) {
    final existingItem = _cart.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity > 0 && quantity > 0) {
      existingItem.quantity = quantity;
    } else if (existingItem.quantity > 0 && quantity == 0) {
      removeItemFromCart(product);
    }

    notifyListeners();
  }
}
