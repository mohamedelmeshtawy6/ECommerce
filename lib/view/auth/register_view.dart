import 'package:e_commerce/core/view_model/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  RegisterView({super.key});
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(children: [
          Card(
            child: Form(
              key: _form,
              child: Column(children: [
                CustomText(text: "SIGN UP", fontSize: 30, color: primaryColor),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  text: 'name',
                  hint: "mohamed ",
                  onsave: (val) {
                    controller.name = val!;
                  },
                  validate: (val) {
                    if (val == null) {
                      Get.snackbar('error', 'enter email');
                      return "enter password";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextField(
                  text: 'email',
                  hint: 'moh@gmail.com',
                  onsave: (val) {
                    controller.email = val!;
                  },
                  validate: (val) {
                    if (val == null) {
                      Get.snackbar('error', 'enter email');
                      return "enter password";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  text: 'Password',
                  hint: '***********',
                  onsave: (val) {
                    controller.password = val!;
                  },
                  validate: (val) {
                    if (val == null) {
                      Get.snackbar('error', 'enter password');
                      return "enter password";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomButton(
                    text: "SIGN up",
                    onpress: () {
                      _form.currentState!.save();
                      if (_form.currentState!.validate()) {
                        controller.ceateAccountWithemailAndPassword();
                      }
                    }),
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
