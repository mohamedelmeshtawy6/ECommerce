// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? userId;
  String? name;
  String? picture;
  String? email;

  UserModel({this.userId, this.name, this.email, this.picture});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    userId = map['userId'];
    name = map['name'];
    email = map['email'];
    picture = map['picture'];
  }

  toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'picture': picture,
    };
  }
}
