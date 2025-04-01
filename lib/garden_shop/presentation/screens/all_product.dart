// data/plant_repository.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lesoon1/garden_shop/data/models/product_model.dart';
import 'package:lesoon1/garden_shop/data/repository/plant_repository.dart';
import 'package:lesoon1/garden_shop/presentation/components/category_tile.dart';
import 'package:lesoon1/garden_shop/presentation/components/product_tile.dart';
import 'package:provider/provider.dart';

class AllProduct extends StatefulWidget {
  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  String selectedCategory = 'All plants';

  List<ProductModel> getFilteredProducts(List<ProductModel> products) {
    return products.where((product) {
      final matchesCategory = selectedCategory == 'All plants' ||
          product.category == selectedCategory;
      final matchesSearch = product.name.toLowerCase().contains(searchQuery);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  final PlantRepository repository = PlantRepository();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final products = context.watch<PlantRepository>().plantsShop;
    final filteredProducts = getFilteredProducts(products);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Plant Catalog",
            style: GoogleFonts.taiHeritagePro(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 30,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: const InputDecoration(
                hintText: 'Поиск по названию растения...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(5),
              children: [
                CategoryTile(text: 'All plants'),
                CategoryTile(text: 'Indoors'),
                CategoryTile(text: 'OutDoors'),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
              ),
              itemCount: filteredProducts.length,
              padding: const EdgeInsets.all(5),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductTile(productModel: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
