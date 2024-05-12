import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  List<String> image = [
    'assets/slider-1.jpg',
    'assets/slider-2.jpg',
    'assets/slider-3.jpg'
  ];
  final ValueNotifier<int> _selectedSilder = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      CarouselSlider(
        options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            height: 200.0,
            onPageChanged: (int page, _) {
              _selectedSilder.value = page;
            }),
        items: image.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Image.asset(
                    '$i',
                    fit: BoxFit.cover,
                  ));
            },
          );
        }).toList(),
      ),
      SizedBox(height: 10),
      ValueListenableBuilder(
          valueListenable: _selectedSilder,
          builder: (context, value, _) {
            List<Widget> list = [];
            for (var i = 0; i < 5; i++) {
              list.add(Container(
                height: 10,
                width: 10,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: value == i ? Colors.blue : null,
                ),
              ));
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list,
            );
          })
    ]));
  }
}
