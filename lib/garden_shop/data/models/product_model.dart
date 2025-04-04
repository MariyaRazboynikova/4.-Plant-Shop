import 'package:lesoon1/garden_shop/domain/entity/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.name,
    required super.price,
    required super.category,
    required super.imagePath,
    required super.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      category: json['category'],
      imagePath: json['imagePath'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'category': category,
        'imagePath': imagePath,
        'description': description,
      };
}
