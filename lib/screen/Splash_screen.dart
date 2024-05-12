import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycommerce/screen/login_screen.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goTo_next();
  }

  void goTo_next() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAll(() => LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Image.asset('assets/Splash_logo.png'),
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 10,
          ),
          const Text("Version : 1.0.0"),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
