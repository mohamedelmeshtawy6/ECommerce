// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  String? name, image;
  CategoryModel({this.image, this.name});

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];

    image = map['image'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
