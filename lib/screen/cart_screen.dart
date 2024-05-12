import 'package:flutter/material.dart';

import '../widget/Cart_list.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Cart_list(),
              Cart_list(),
              Cart_list(),
              Cart_list(),
            ],
          ),
        ),
      ),
    );
  }
}


