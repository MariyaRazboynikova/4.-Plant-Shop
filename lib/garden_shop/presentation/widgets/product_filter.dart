import 'package:lesoon1/garden_shop/domain/entity/product.dart';

class ProductFilter {
  String searchQuery = '';
  String selectedCategory = 'All plants';

  List<Product> applyFilters(List<Product> products) {
    return products.where((product) {
      final matchesCategory = selectedCategory == 'All plants' ||
          product.category == selectedCategory;
      final matchesSearch = product.name.toLowerCase().contains(searchQuery);
      return matchesCategory && matchesSearch;
    }).toList();
  }
}
