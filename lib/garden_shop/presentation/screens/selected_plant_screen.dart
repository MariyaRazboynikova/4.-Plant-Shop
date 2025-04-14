import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/domain/entity/product.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/button.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/info_card.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/text.dart';
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
    final repository = context.read<PlantRepositoryImpl>();

    for (int i = 0; i < quantity; i++) {
      repository.addItemToCart(widget.product, 1);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product.name} x$quantity добавлено в корзину!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_screen'),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              style: MyTextStyle.normalTextStyle(context),
            ),
            const SizedBox(height: 10),
            Text(
              widget.product.description,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Button(
                    text: 'Добавить в корзину',
                    onTap: addToCart,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
