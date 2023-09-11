import 'package:e_commerce/core/view_model/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/view_model/control_viewmodel.dart';
import 'auth/login_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (controller.user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (control) => Scaffold(
                body: control.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
        builder: (controller) => BottomNavigationBar(
                onTap: (index) {
                  controller.changeSelectedValue(index);
                },
                currentIndex: controller.navigatorValue,
                items: [
                  BottomNavigationBarItem(
                      activeIcon: const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text('Home'),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'assets/images/home.png',
                          fit: BoxFit.contain,
                          width: 15,
                        ),
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      activeIcon: const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text('cart'),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'assets/images/cart.png',
                          fit: BoxFit.contain,
                          width: 15,
                        ),
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      activeIcon: const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text('account'),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'assets/images/person.png',
                          fit: BoxFit.contain,
                          width: 15,
                        ),
                      ),
                      label: ''),
                ]));
  }
}
