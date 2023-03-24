// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/view_model/cart_viewmodel.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/model/product_model.dart';
import 'package:get/get.dart';

import '../constance.dart';

class DetailsView extends StatelessWidget {
  final ProductModel model;
  const DetailsView({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 270,
            child: Image.network(
              model.image.toString(),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomText(fontSize: 26, text: model.name.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .43,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(text: 'Size'),
                                  CustomText(text: model.sized.toString())
                                ]),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .43,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(text: 'Color'),
                                  Container(
                                      width: 30,
                                      height: 20,
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: model.color))
                                ]),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: 'Details',
                        fontSize: 18,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: model.description.toString(),
                        height: 2,
                      ),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: 'PRICE',
                      fontSize: 18,
                    ),
                    CustomText(
                        color: primaryColor,
                        text: '\$  +  ${model.price.toString()}'),
                  ],
                ),
                GetBuilder<CartViewModel>(
                  // init: Get.find(),
                  builder: (contoller) => SizedBox(
                      height: 60,
                      width: 130,
                      child: CustomButton(
                          text: 'Add',
                          onpress: () {
                            contoller.addProduct(CartProductModel(
                                name: model.name,
                                image: model.image,
                                price: model.price,
                                quantity: 1,
                                productId: model.productId));
                          })),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
