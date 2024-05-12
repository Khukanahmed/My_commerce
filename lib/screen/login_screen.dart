import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycommerce/screen/sign_up.dart';

import 'Buttom_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailtext = TextEditingController();
  TextEditingController _passtext = TextEditingController();
  bool password = true;
  GlobalKey<FormState> _logkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: SingleChildScrollView(
          child: Form(
            key: _logkey,
            child: Column(
              children: [
                Center(
                    child: Image.asset(
                  'assets/Splash_logo.png',
                  width: 200,
                )),
                SizedBox(height: 10),
                const Text(
                  'Welcome Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const Text('Please Enter Your Email And Password',
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
                const SizedBox(height: 30),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailtext,
                  decoration: const InputDecoration(hintText: 'Email Address'),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter your email address';
                    } else if (text!.isEmail == false) {
                      return 'Enter a valid Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: password,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passtext,
                  decoration:  InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(password
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                                () {
                              password = !password;
                            },
                          );
                        },
                      ),hintText: 'Password'),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter your password';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    if (_logkey.currentState!.validate()) {
                      Get.offAll(Navigation_bar());
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.blue,
                    child: const Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    )),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {}, child: const Text('Forget Password!')),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(const SignUp());
                          },
                          child: const Text('SignUp',
                              style: TextStyle(fontSize: 18)))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
