import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycommerce/screen/product_details.dart';

import '../widget/Silder.dart';
import '../widget/product_list.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/Splash_logo.png',
          height: 80,
        ),
        title: RichText(
          text: const TextSpan(
            text: 'My ',
            style: TextStyle(fontSize: 20, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: 'Commerce',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue)),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(LoginScreen());
              },
              child: Text('Login'))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: HomeSlider(),
          ),
          SizedBox(
            height: 470,
            child: DynamicHeightGridView(
                itemCount: 20,
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                builder: (ctx, index) {
                  return InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Get.to(const ProductDetails());
                      },
                      child: const product());
                }),
          )
        ],
      ),
    );
  }
}
