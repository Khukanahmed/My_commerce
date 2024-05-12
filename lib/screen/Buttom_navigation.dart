import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycommerce/screen/cart_screen.dart';
import 'package:mycommerce/screen/home_screen.dart';
import 'Controller.dart';

class Navigation_bar extends StatefulWidget {
  const Navigation_bar({super.key});

  @override
  State<Navigation_bar> createState() => _Navigation_barState();
}

class _Navigation_barState extends State<Navigation_bar> {
  MainNavbottomController mainNavbottomController =
      Get.put(MainNavbottomController());
  final List<Widget> _screens = [
    HomeScreen(),
    CartScreen(),
    CartScreen(),
    CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavbottomController>(builder: (Controller) {
      return Scaffold(
        body: _screens[Controller.currentSelectindex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: Controller.currentSelectindex,
          onTap: Controller.changeScreen,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Categoris'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet_giftcard_rounded), label: 'Wishlist')
          ],
        ),
      );
    });
  }
}
