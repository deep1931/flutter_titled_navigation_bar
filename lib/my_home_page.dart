import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_titled_navigation_bar/tabs/orders_tab_screen.dart';
import 'package:flutter_titled_navigation_bar/tabs/profile_tab_screen.dart';
import 'package:flutter_titled_navigation_bar/tabs/search_tab_screen.dart';
import 'package:flutter_titled_navigation_bar/tabs/home_tab_screen.dart';
import 'package:flutter_titled_navigation_bar/tabs/bag_tab_screen.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
    TitledNavigationBarItem(title: Text('Search'), icon: Icons.search),
    TitledNavigationBarItem(title: Text('Bag'), icon: Icons.card_travel),
    TitledNavigationBarItem(title: Text('Orders'), icon: Icons.shopping_cart),
    TitledNavigationBarItem(title: Text('Profile'), icon: Icons.person_outline),
  ];

  final List<Widget> listScreens = [
    HomeTabScreen(),
    SearchTabScreen(),
    BagTabScreen(),
    OrdersTabScreen(),
    ProfileTabScreen()
  ];
  bool navBarMode = false;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Switch(
                value: navBarMode,
                onChanged: (v) {
                  setState(() => navBarMode = v);
                },
              ),
            ],
          ),
        ],
        title: Text("Titled Bottom Bar"),
      ),
      body: listScreens[_selectedIndex],
      bottomNavigationBar: TitledBottomNavigationBar(
        onTap: (index) {
          print("Selected Index: $index");
          setState(() {
            _selectedIndex = index;
          });
        },
        reverse: navBarMode,
        curve: Curves.easeInBack,
        items: items,
        currentIndex: _selectedIndex,
        activeColor: Colors.red,
        inactiveColor: Colors.blueGrey,
      ),
    );
  }
}
