import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/domain/entity/product.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/info_card.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/quantity_selector.dart';
import 'package:lesoon1/garden_shop/presentation/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:lesoon1/garden_shop/data/repository/plant_repository_impl.dart';

class SelectedPlantScreen extends StatelessWidget {
  final Product product;

  const SelectedPlantScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(),
            const SizedBox(height: 20),
            _buildInfoCards(),
            const SizedBox(height: 20),
            _buildProductDetails(context),
            const Spacer(),
            _buildQuantityAndCartSection(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back,
            color: Theme.of(context).colorScheme.secondary, size: 30),
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/cart_screen'),
          icon: Icon(Icons.shopping_cart_outlined,
              color: Theme.of(context).colorScheme.secondary),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Center(
      child: Image.asset(product.imagePath, height: 150),
    );
  }

  Widget _buildInfoCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        InfoCard(icon: Icons.height, value: '1.30', label: 'Height'),
        InfoCard(icon: Icons.water_drop, value: '63%', label: 'Humidity'),
        InfoCard(icon: Icons.thermostat, value: '19-25°C', label: 'Temp'),
      ],
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name, style: MyTextStyle.normalTextStyle(context)),
        const SizedBox(height: 10),
        Text(product.description,
            style: TextStyle(fontSize: 18, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildQuantityAndCartSection(BuildContext context) {
    return QuantitySelector(
      initialQuantity: 1,
      onAddToCartPressed: (quantity) => _handleAddToCart(context, quantity),
    );
  }

  void _handleAddToCart(BuildContext context, int quantity) {
    final repository = context.read<PlantRepositoryImpl>();
    repository.addItemToCart(product, quantity);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('${product.name} x$quantity добавлено в корзину!')),
    );
  }
}
