import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  Rx<int> carousalCurrentIndex = 0.obs;
  void updatePageIndicator(index) => carousalCurrentIndex.value = index;
}