import 'package:e_commerce/core/view_model/auth_viewmodel.dart';
import 'package:e_commerce/view/auth/register_view.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constance.dart';
import '../widgets/custom_button_social.dart';
import '../widgets/custom_text.dart';

class LoginView extends GetWidget<AuthViewModel> {
  LoginView({super.key});

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(children: [
          Card(
            child: Form(
              key: _form,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Welcome", fontSize: 30),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => RegisterView());
                      },
                      child: CustomText(
                          text: "SIGN UP", fontSize: 16, color: primaryColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "sign in to continuo",
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  text: 'email',
                  hint: 'moh@gmail.com',
                  onsave: (val) {
                    if (val != null) controller.email = val;
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
                    if (val != null) controller.password = val;
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
                const SizedBox(height: 10),
                CustomText(
                  text: "forget password ?",
                  fontSize: 14,
                  color: Colors.grey,
                  alignment: Alignment.topRight,
                ),
                CustomButton(
                    text: "SIGN IN",
                    onpress: () {
                      _form.currentState!.save();
                      if (_form.currentState!.validate()) {
                        controller.emailPasswordSignIn();
                      }
                    }),
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomText(
            text: "-OR- ",
            alignment: Alignment.center,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButtonSocial(
            onpress: () {
              controller.facebookSignIn();
            },
            imageName: "assets/images/facebook.png",
            text: "Sign in with facebook",
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonSocial(
            onpress: () {
              controller.googleSignIn();
            },
            imageName: "assets/images/google.png",
            text: "Sign in with google",
          )
        ]),
      ),
    );
  }
}
