import 'package:e_commerce/core/view_model/auth_viewmodel.dart';
import 'package:e_commerce/core/view_model/checkout_viewmodel.dart';
import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:get/get.dart';

import '../core/view_model/cart_viewmodel.dart';
import '../core/view_model/control_viewmodel.dart';
import '../core/view_model/home_viewmodel.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.put(CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CheckoutViewModel());
  }
}
