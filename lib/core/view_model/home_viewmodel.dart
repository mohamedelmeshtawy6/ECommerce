import 'package:e_commerce/core/services/home_service.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';

class HomeViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  final List<ProductModel> _productsModel = [];
  List<ProductModel> get productsModel => _productsModel;

  @override
  void onInit() async {
    super.onInit();
    await getCategory();
    getbestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    await HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
      }
      _loading.value = false;
    });
    update();
  }

  getbestSellingProducts() async {
    _loading.value = true;
    await HomeService().getBestSelling().then((value) {
      for (var i = 0; i < value.length; i++) {
        _productsModel.add(
            ProductModel.fromJson(value[i].data() as Map<String, dynamic>));
      }
      _loading.value = false;
    });
    update();
  }
}
