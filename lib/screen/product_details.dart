import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mycommerce/screen/cart_screen.dart';

import '../widget/increment_button.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Center(
                        child: Card(
                            child: Image.asset(
                          'assets/Product_img.png',
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Red Seed Oil Shampoo',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text('Total Price : \$100',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blue)),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        customstapper(
                          lowerlimit: 1,
                          onchange: (val) {},
                          stepvalue: 1,
                          upperlimit: 10,
                          value: 1,
                        )
                      ],
                    ),
                    const Text('Description:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    const Text(
                        'Product descriptions enter the picture at a pivotal stage of the customer journey. Your potential customer feels that they know enough about your brand and they’re ready to explore specific products.Make sure that your brand’s unique voice comes through in your product descriptions. It should be memorable, recognizable, and aligned with your target audience’s typical way of speaking and their values Creative product descriptions that include a bit of storytelling can help your users imagine how the product will fit into their lives, making them more likely to buy.'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(CartScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.blue,
                  child: const Center(
                      child: Text(
                    'ADD TO CART',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
