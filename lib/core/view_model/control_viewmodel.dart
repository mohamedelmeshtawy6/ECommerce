import 'package:e_commerce/view/cart_view.dart';
import 'package:e_commerce/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/home_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  int get navigatorValue => _navigatorValue;

  Widget _currentScreen = const HomeView();

  Widget get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        _currentScreen = const HomeView();
        break;

      case 1:
        _currentScreen = const CartView();
        break;
      case 2:
        _currentScreen = const ProfileView();
        break;
    }
    update();
  }
}
