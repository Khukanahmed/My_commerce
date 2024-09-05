import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mycommerce/screen/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailtext = TextEditingController();
  TextEditingController _nametext = TextEditingController();
  TextEditingController _passwordtext = TextEditingController();
  TextEditingController _confimpasstext = TextEditingController();
  TextEditingController dateInput = TextEditingController(text: '');

  TextEditingController intialdateval = TextEditingController();

  GlobalKey<FormState> _signkey = GlobalKey<FormState>();
  bool newdata = false;
  bool Create_password = true;
  bool Confrim_password = true;

  final List<String> items = [
    'Bangladesh',
    'Afghanistan',
    'Madagascar',
    'Malawi',
  ];
  String? selectedValue;

  void clearTextField() {
    dateInput.clear();
  }

  @override
  void setState(VoidCallback fn) {
    newdata;
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    dateInput.text = "";
  }

  String? _character = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _signkey,
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.asset(
                  //   'assets/Splash_logo.png',
                  //   width: 200,
                  // ),
                  const SizedBox(height: 40),
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          ' Welcome SignUp',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        Text('Create Your Profile',
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),
                  const Text(
                    'Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _nametext,
                    decoration: const InputDecoration(hintText: 'Name'),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your Name';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Birth-Date',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    scrollPadding: EdgeInsets.zero,
                    readOnly: true,
                    controller: dateInput,
                    decoration: const InputDecoration(
                      //  contentPadding: EdgeInsets.zero,
                      prefixIcon: Icon(
                        Icons.date_range,
                      ),
                      hintText: 'Birth-date',
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('dd-MMMM-yyyy').format(pickedDate);
                        setState(() {
                          dateInput.text = formattedDate;
                        });
                      } else {}
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Write your birthdate';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Gender',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),

                  Row(
                    children: <Widget>[
                      Radio<String>(
                        value: "Male",
                        groupValue: _character,
                        onChanged: (String? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      Text('Male'),
                      Radio<String>(
                        value: 'Female',
                        groupValue: _character,
                        onChanged: (String? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      const Text('Female'),
                    ],
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailtext,
                    decoration:
                        const InputDecoration(hintText: 'Email Address'),
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

                  const Text(
                    'Create Password',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    obscureText: Create_password,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordtext,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Create_password
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                Create_password = !Create_password;
                              },
                            );
                          },
                        ),
                        hintText: 'Create Password'),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Create your password';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Confirm Password',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    obscureText: Confrim_password,

                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _confimpasstext,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Confrim_password
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                Confrim_password = !Confrim_password;
                              },
                            );
                          },
                        ),
                        hintText: 'Confirm Password'),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter confirm Password';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Country',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Select your Country',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: double.infinity,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      if (_signkey.currentState!.validate()) {
                        Get.to(() => LoginScreen());
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.blue,
                      child: const Center(
                          child: Text(
                        'SignUp',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      )),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 18),
                        ),
                        TextButton(
                            onPressed: (

                                ) {

                              Get.to(const LoginScreen());


                            },
                            child: const Text('Login',
                                style: TextStyle(fontSize: 18)))
                      ],
                    ),
                  ),

                ]),
          ),
        ),
      ),
    ));
  }
}
