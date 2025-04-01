// data/plant_repository.dart
import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/data/models/shop_model.dart';
import 'package:provider/provider.dart';

class AllProduct extends StatelessWidget {
  final PlantRepository repository = PlantRepository();

  @override
  Widget build(BuildContext context) {
    final products = context.watch<PlantRepository>().plantsShop;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Plant Catalog",
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final plant = products[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                plant.imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                plant.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(plant.description),
              trailing: Text("\$${plant.price.toStringAsFixed(2)}"),
            ),
          );
        },
      ),
    );
  }
}
