// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:e_commerce/helper/extention.dart';

class ProductModel {
  String? name, image, description, sized, price, productId;
  Color? color;
  ProductModel(
      {this.price,
      this.name,
      this.image,
      this.description,
      this.color,
      this.sized,
      this.productId});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'productId': productId
    };
  }
}
