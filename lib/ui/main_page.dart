import 'package:api_gsg/ui/widges/Home_page.dart';
import 'package:api_gsg/ui/widges/cart_product.dart';
import 'package:api_gsg/ui/widges/favourite_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int index = 0;
  TabController tabController;
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_outline,
      ),
      label: 'favourite',
    ),
  ];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomePage(),
          CartPage(),
          FavouriteProducts(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        //notche margin between floating button and bottom appbar
        child: BottomNavigationBar(
          unselectedItemColor: Color(0xFF6f52ed).withOpacity(0.6),
          fixedColor: Color(0xFF6f52ed),
          onTap: (tapedIndex) {
            this.index = tapedIndex;
            tabController.animateTo(tapedIndex);
            setState(() {});
          },
          currentIndex: index,
          items: items,
        ),
      ),
    );
  }
}
