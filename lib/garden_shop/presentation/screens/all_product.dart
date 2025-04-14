import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lesoon1/garden_shop/data/repository/plant_repository_impl.dart';
import 'package:lesoon1/garden_shop/domain/entity/product.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/category_tile.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/product_filter.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/product_tile.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/text.dart';
import 'package:provider/provider.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final ProductFilter _filter = ProductFilter();
  final List<String> _categories = ['All plants', 'Indoor', 'Outdoor'];

  void _handleSearchChanged(String value) {
    setState(() => _filter.searchQuery = value.toLowerCase());
  }

  void _handleCategorySelected(String category) {
    setState(() => _filter.selectedCategory = category);
  }

  @override
  Widget build(BuildContext context) {
    final products = context.watch<PlantRepositoryImpl>().plantsShop;
    final filteredProducts = _filter.applyFilters(products);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildSearchField(),
          _buildCategoryFilters(),
          _buildProductGrid(filteredProducts),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          "Plant Catalog",
          style: MyTextStyle.normalTextStyle(context),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/cart_screen'),
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: TextField(
        onChanged: _handleSearchChanged,
        decoration: const InputDecoration(
          hintText: 'Поиск по названию растения...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        children: _categories.map((category) {
          return GestureDetector(
            onTap: () => _handleCategorySelected(category),
            child: CategoryTile(
              text: category,
              isSelected: _filter.selectedCategory == category,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProductGrid(List<Product> products) {
    return Expanded(
      child: products.isEmpty
          ? Center(
              child: Text(
                "Нет подходящих растений",
                style: GoogleFonts.taiHeritagePro(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
              ),
              itemCount: products.length,
              padding: const EdgeInsets.all(5),
              itemBuilder: (context, index) {
                return ProductTile(
                  product: products[index],
                );
              },
            ),
    );
  }
}
