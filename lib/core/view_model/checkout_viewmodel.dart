import 'package:e_commerce/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/enum.dart';

class CheckoutViewModel extends GetxController {
  int _index = 0;
  int get index => _index;

  late String steet1, steet2, city, state, country;

  GlobalKey<FormState> key = GlobalKey<FormState>();

  Pages _pages = Pages.deliveryTime;
  Pages get pages => _pages;

  changeIndex(int i) {
    if (i == 0 || i < 0) {
      _pages = Pages.deliveryTime;
      _index = 0;
    }
    if (i == 1) {
      _pages = Pages.addAddress;
      _index = i;
    } else if (i == 2) {
      key.currentState!.save();
      if (key.currentState!.validate()) {
        _pages = Pages.summary;
        _index = i;
      }
    } else if (i == 3 || i > 3) {
      Get.off(() => const ControlView());
      _pages = Pages.deliveryTime;
      _index = 0;
    }
    update();
  }
}
