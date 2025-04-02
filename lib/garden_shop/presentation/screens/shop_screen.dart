import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lesoon1/garden_shop/data/models/product_model.dart';
import 'package:lesoon1/garden_shop/data/repository/plant_repository.dart';
import 'package:lesoon1/garden_shop/presentation/components/category_tile.dart';
import 'package:lesoon1/garden_shop/presentation/components/product_tile.dart';
import 'package:lesoon1/garden_shop/presentation/screens/popular_product_card.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String selectedCategory = 'All plants';
  @override
  Widget build(BuildContext context) {
    final products = context.watch<PlantRepository>().plantsShop;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Plant Shop Page',
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.secondary,
            size: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildCategoryList(),
                _buildProductList(products),
                _buildSeeMoreButton(),
                _buildPopularProductSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        children: ['All plants', 'Indoor', 'Outdoor'].map((category) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
            },
            child: CategoryTile(
              text: category,
              isSelected: selectedCategory == category,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProductList(List<ProductModel> products) {
    final filteredProducts = selectedCategory == 'All plants'
        ? products
        : products
            .where((product) => product.category == selectedCategory)
            .toList();

    return SizedBox(
      height: 310,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return ProductTile(productModel: product);
        },
      ),
    );
  }

  Widget _buildSeeMoreButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/all_product');
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              RotationTransition(
                turns: AlwaysStoppedAnimation(45 / 360),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Text(
                'See More',
                style: GoogleFonts.taiHeritagePro(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPopularProductSection() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/selected_plant_screen'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Most Popular',
                style: GoogleFonts.taiHeritagePro(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            PopularProductCard(
              imagePath: 'lib/assets/Rubber_Tree.jpeg',
              title: 'Rubber Tree',
              description: 'Rubber Tree is a nice outdoor plants...',
            ),
          ],
        ),
      ),
    );
  }
}
