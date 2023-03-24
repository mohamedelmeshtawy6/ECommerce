import 'package:e_commerce/constance.dart';
import 'package:e_commerce/core/view_model/cart_viewmodel.dart';
import 'package:e_commerce/core/view_model/checkout_viewmodel.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryP extends StatelessWidget {
  const SummaryP({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                  height: 250,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext c, int index) => Container(
                      child: Container(
                        width: 150,
                        child: Column(children: [
                          Container(
                            width: 150,
                            height: 180,
                            child: Image.network(
                              controller.cartProductModel[index].image
                                  .toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          CustomText(
                              text: controller.cartProductModel[index].name
                                  .toString()),
                          const SizedBox(height: 10),
                          CustomText(
                              color: primaryColor,
                              text: controller.cartProductModel[index].price
                                  .toString())
                        ]),
                      ),
                    ),
                    itemCount: controller.cartProductModel.length,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Shipping Address',
                fontSize: 24,
              ),
            ),
            GetBuilder<CheckoutViewModel>(
              builder: (contoller) => CustomText(
                  text:
                      '${contoller.steet1},${contoller.steet2},${contoller.country},${contoller.city},${contoller.state}',
                  fontSize: 24,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
