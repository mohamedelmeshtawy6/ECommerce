import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  UserModel? _usermodel = UserModel(
    email: 'mo',
    name: 'moha',
  );
  UserModel? get usermodel => _usermodel;

  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  final LocalStorageData controller = Get.find();

  void getCurrentUser() async {
    try {
      controller.userData().then((value) {
        _usermodel = value!;
        update(); // add this line to update the UI after retrieving user data
      });
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  void signout() async {
    // GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    //FacebookAuth.instance.logOut();
    controller.deletUser();
  }
}
