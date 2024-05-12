import 'package:get/get.dart';

class MainNavbottomController extends GetxController {
  int currentSelectindex = 0;
  void changeScreen(int index) {
    currentSelectindex = index;
    update();
  }
}
