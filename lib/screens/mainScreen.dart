import 'package:flutter/material.dart';
import 'package:shop_app/screens/homePageTabs/home.dart';
import 'package:shop_app/screens/homePageTabs/favourites.dart';
import 'package:shop_app/screens/homePageTabs/profile.dart';
import 'package:shop_app/screens/homePageTabs/cart.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'mainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  void onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          HomePage(),
          ProfilePage(),
          FavoritesPage(),
          Cart(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12.0),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
        selectedItemColor: Color(0xff996300),
      ),
    );
  }
}
