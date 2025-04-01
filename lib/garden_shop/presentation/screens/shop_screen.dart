import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lesoon1/garden_shop/data/models/product_model.dart';
import 'package:lesoon1/garden_shop/data/models/shop_model.dart';
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
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final products = context.watch<PlantRepository>().plantsShop;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildSearchField(),
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

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
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
    );
  }

  Widget _buildSearchField() {
    return Padding(
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
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        children: [
          CategoryTile(text: 'All plants'),
          CategoryTile(text: 'Indoors'),
          CategoryTile(text: 'OutDoors'),
          CategoryTile(text: 'Organic'),
        ],
      ),
    );
  }

  Widget _buildProductList(List<ProductModel> products) {
    return SizedBox(
      height: 310,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) {
          final product = products[index];
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
    return Padding(
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
    );
  }
}

// Widget _buildCategoryTile(String text) {
//   return Container(
//     margin: const EdgeInsets.all(10),
//     padding: const EdgeInsets.symmetric(horizontal: 5),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Text(
//       text,
//       style: GoogleFonts.taiHeritagePro(
//         color: Theme.of(context).colorScheme.secondary,
//         fontSize: 20,
//         fontWeight: FontWeight.w300,
//       ),
//     ),
//   );
// }
