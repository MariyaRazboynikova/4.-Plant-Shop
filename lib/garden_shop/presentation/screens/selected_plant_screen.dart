import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lesoon1/garden_shop/domain/entity/product.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/button.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/info_card.dart';
import 'package:provider/provider.dart';
import 'package:lesoon1/garden_shop/data/repository/plant_repository_impl.dart';

class SelectedPlantScreen extends StatefulWidget {
  final Product product;

  const SelectedPlantScreen({super.key, required this.product});

  @override
  State<SelectedPlantScreen> createState() => _SelectedPlantScreenState();
}

class _SelectedPlantScreenState extends State<SelectedPlantScreen> {
  int quantity = 1;

  void addToCart() {
    final cartItem = List.generate(quantity, (_) => widget.product);
    context.read<PlantRepositoryImpl>().addMultipleItemsToCart(cartItem);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product.name} x$quantity добавлено в корзину!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Image.asset(widget.product.imagePath, height: 150),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(icon: Icons.height, value: '1.30', label: 'Height'),
                InfoCard(
                    icon: Icons.water_drop, value: '63%', label: 'Humidity'),
                InfoCard(
                    icon: Icons.thermostat, value: '19-25°C', label: 'Temp'),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.product.name,
              style: GoogleFonts.taiHeritagePro(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.product.description,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text('$quantity', style: const TextStyle(fontSize: 18)),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
                const Spacer(),
                Button(
                  text: 'Добавить в корзину',
                  onTap: addToCart,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
