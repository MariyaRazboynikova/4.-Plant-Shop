import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lesoon1/garden_shop/data/models/product_model.dart';
import 'package:lesoon1/garden_shop/data/repository/plant_repository.dart';
import 'package:lesoon1/garden_shop/presentation/screens/selected_plant_screen.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  const ProductTile({super.key, required this.productModel});

  void addItemToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Добавить этот товар в корзину?'),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Закрыть'),
          ),
          MaterialButton(
            onPressed: () {
              context.read<PlantRepository>().addItemToCart(productModel);
              Navigator.pop(context);
            },
            child: const Text('Добавить'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectedPlantScreen(product: productModel),
          ),
        );
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              child: Image.asset(productModel.imagePath, height: 150),
            ),
            Text(
              productModel.name,
              style: GoogleFonts.taiHeritagePro(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              child: Text(
                productModel.category,
                style: GoogleFonts.taiHeritagePro(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 15,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${productModel.price.toStringAsFixed(2)}',
                  style: GoogleFonts.taiHeritagePro(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () => addItemToCart(context),
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
