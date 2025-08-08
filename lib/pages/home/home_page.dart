import 'package:delivery/pages/account/account_page.dart';
import 'package:delivery/pages/auth/sign_up_page.dart';
import 'package:delivery/pages/cart/cart_history.dart';
import 'package:delivery/utils/app_color.dart';
import 'package:delivery/utils/demensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainFoodPage(),
    SignUpPage(),
    CartHistory(),
    AccountPage(),
  ];
  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.mainColor,
        unselectedItemColor: AppColor.yellowColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.archive,
              ),
              label: "history"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: "shopping cart"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "me"),
        ],
      ),
    );
  }
}
