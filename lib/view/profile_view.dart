import 'package:e_commerce/core/view_model/profile_viewmodel.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 120,
                              height: 120,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              )
                              /*image: DecorationImage(
                                image: controller.usermodel!.picture ==
                                        null
                                    ? AssetImage(
                                        'assets/images/devimage.png')
                                    : controller.usermodel!.picture ==
                                            'default'
                                        ? AssetImage(
                                            'assets/images/devimage.png')
                                        : AssetImage(controller
                                            .usermodel!.picture
                                            .toString()))),*/
                              ),
                          Column(
                            children: [
                              CustomText(
                                text: controller.usermodel!.name.toString(),
                                fontSize: 23,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: controller.usermodel!.email.toString(),
                                fontSize: 14,
                                color: Colors.black,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: Image.asset('assets/images/edit.png'),
                          title: CustomText(
                            text: 'Edit Profile',
                          ),
                          trailing: const Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: Image.asset('assets/images/edit.png'),
                          title: CustomText(
                            text: 'Shipping Address',
                          ),
                          trailing: const Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: Image.asset('assets/images/edit.png'),
                          title: CustomText(
                            text: 'Order History',
                          ),
                          trailing: const Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: Image.asset('assets/images/edit.png'),
                          title: CustomText(
                            text: 'Cards',
                          ),
                          trailing: const Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: Image.asset('assets/images/edit.png'),
                          title: CustomText(
                            text: 'Notifications',
                          ),
                          trailing: const Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          controller.signout();
                        },
                        child: ListTile(
                          leading: Image.asset('assets/images/edit.png'),
                          title: CustomText(
                            text: 'Log Out',
                          ),
                          trailing: const Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
