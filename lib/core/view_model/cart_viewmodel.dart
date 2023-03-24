import 'package:e_commerce/core/services/database/cart_database.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  CartViewModel() {
    getAllproduct();
  }

  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totlaPrice => _totlaPrice;
  double _totlaPrice = 0.0;

  var dbCart = CartDatabase.db;

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }

    dbCart.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totlaPrice +=
        (double.parse(cartProductModel.price!) * cartProductModel.quantity!);

    update();
  }

  getAllproduct() async {
    _loading.value = true;
    _cartProductModel = await dbCart.getAllProduct();
    _loading.value = false;
    getTotlaPrice();
    update();
  }

  getTotlaPrice() {
    for (var i = 0; i < _cartProductModel.length; i++) {
      _totlaPrice += (double.parse(_cartProductModel[i].price!) *
          _cartProductModel[i].quantity!);

      update();
    }
  }

  increaseQuantity(int index) async {
    cartProductModel[index].quantity = cartProductModel[index].quantity! + 1;
    _totlaPrice += double.parse(_cartProductModel[index].price!);
    await dbCart.updateProduct(_cartProductModel[index]);
    await Future.delayed(const Duration(microseconds: 10));
    update();
  }

  decreaseQuantity(int index) async {
    cartProductModel[index].quantity = cartProductModel[index].quantity! - 1;
    _totlaPrice -= double.parse(_cartProductModel[index].price!);
    await dbCart.updateProduct(_cartProductModel[index]);

    await Future.delayed(const Duration(microseconds: 10));

    update();
  }
}
