import 'package:get/get.dart';

class HomeController{
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}