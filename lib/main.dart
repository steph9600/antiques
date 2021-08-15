import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/consts/theme_data.dart';
import 'package:shop_app/provider/dark_theme_provider.dart';
import 'package:shop_app/provider/products.dart';
import 'package:shop_app/screens/homePageTabs/cart.dart';
import 'package:shop_app/screens/homePageTabs/favourites.dart';
import 'package:shop_app/screens/mainScreen.dart';
import 'package:shop_app/screens/productDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();
  void getCurrentAppTheme() async {
    themeProvider.darkTheme =
        await themeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeProvider;
          }),
          ChangeNotifierProvider(create: (_) {
            return Products();
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Furniture App',
            theme: Styles.themeData(themeProvider.darkTheme, context),
            home: MainScreen(),
            routes: {
              MainScreen.id: (context) => MainScreen(),
              FavoritesPage.id: (context) => FavoritesPage(),
              Cart.id: (context) => Cart(),
              ProductDetails.id: (context) => ProductDetails()
            },
          );
        }));
  }
}
