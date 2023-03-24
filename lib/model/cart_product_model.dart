class CartProductModel {
  String? name, image, price, productId;
  int? quantity;
  CartProductModel(
      {this.price, this.name, this.image, this.quantity, this.productId});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    quantity = map['quantitiy'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantitiy': quantity,
      'price': price,
      'productId': productId
    };
  }
}
