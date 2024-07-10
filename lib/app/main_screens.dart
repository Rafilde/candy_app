import 'package:candy_app_adm/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/client_list_screen/client_list_screen_page.dart';
import '../features/products_list_screen/product_list_screen_page.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ProductPage(),
    ClientPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: AppColors.primaryColorDark,
        selectedItemColor: AppColors.primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_rounded),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pedidos',
          ),
        ],
      ),
    );
  }
}
