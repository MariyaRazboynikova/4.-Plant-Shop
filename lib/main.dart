import 'package:flutter/material.dart';
import 'package:lesoon1/garden_shop/data/models/shop_model.dart';
import 'package:lesoon1/garden_shop/presentation/screens/all_product.dart';
import 'package:lesoon1/garden_shop/presentation/screens/cart_screen.dart';
import 'package:lesoon1/garden_shop/presentation/screens/intro_screen.dart';
import 'package:lesoon1/garden_shop/presentation/screens/selected_plant_screen.dart';
import 'package:lesoon1/garden_shop/presentation/screens/shop_screen.dart';
import 'package:lesoon1/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ThemesProvider>(create: (_) => ThemesProvider()),
      ChangeNotifierProvider<ShopModel>(create: (_) => ShopModel()),
    ], child: MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemesProvider>(context).themeData,
      home: IntroScreen(),
      routes: {
        '/intro_screen': (context) => IntroScreen(),
        '/shop_screen': (context) => const ShopScreen(),
        '/all_product': (context) => AllProduct(),
        '/selected_plant_screen': (context) => const SelectedPlantScreen(),
        '/cart_screen': (context) => const CartScreen(),
      },
    );
  }
}
