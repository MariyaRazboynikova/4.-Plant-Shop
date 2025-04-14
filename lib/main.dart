import 'package:lesoon1/export.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ThemesProvider>(create: (_) => ThemesProvider()),
      ChangeNotifierProvider<PlantRepositoryImpl>(
          create: (_) => PlantRepositoryImpl(LocalPlantDataSource())),
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
        '/all_product': (context) => AllProductScreen(),
        '/selected_plant_screen': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as ProductModel;
          return SelectedPlantScreen(product: args);
        },
        '/cart_screen': (context) => const CartScreen(),
      },
    );
  }
}
