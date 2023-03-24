import 'package:e_commerce/core/view_model/checkout_viewmodel.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      builder: (contoller) => Form(
        key: contoller.key,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomText(
                    text: 'Billing address is the same as delivery address',
                    fontSize: 20,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    validate: (val) {
                      if (val!.isEmpty) {
                        return 'enter your street';
                      } else {
                        return null;
                      }
                    },
                    onsave: (val) {
                      if (val != null) contoller.steet1 = val;
                    },
                    text: 'Street1',
                    hint: '21, Alex Davidson Avenue',
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    text: 'Street2',
                    hint: 'Opposite Omegatron, Vicent Quarters',
                    validate: (val) {
                      if (val!.isEmpty) {
                        return 'enter your street2';
                      } else {
                        return null;
                      }
                    },
                    onsave: (val) {
                      if (val != null) contoller.steet2 = val;
                    },
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    text: 'City',
                    hint: 'Victoria Island',
                    validate: (val) {
                      if (val!.isEmpty) {
                        return 'enter your city';
                      } else {
                        return null;
                      }
                    },
                    onsave: (val) {
                      if (val != null) contoller.city = val;
                    },
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: CustomTextField(
                              text: 'State',
                              hint: 'Lagos State',
                              validate: (val) {
                                if (val!.isEmpty) {
                                  return 'enter your state';
                                } else {
                                  return null;
                                }
                              },
                              onsave: (val) {
                                if (val != null) contoller.state = val;
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CustomTextField(
                              text: 'Country',
                              hint: 'Nigeria',
                              validate: (val) {
                                if (val!.isEmpty) {
                                  return 'enter your country';
                                } else {
                                  return null;
                                }
                              },
                              onsave: (val) {
                                if (val != null) contoller.country = val;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
