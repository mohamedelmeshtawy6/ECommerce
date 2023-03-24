import 'package:e_commerce/constance.dart';
import 'package:e_commerce/core/view_model/cart_viewmodel.dart';
import 'package:e_commerce/view/checkout/checkout_view.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => controller.cartProductModel.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 200,
                    width: 200,
                    child: SvgPicture.asset('assets/images/cartempty.svg')),
                const SizedBox(height: 20),
                CustomText(
                  text: 'Cart Empty',
                  alignment: Alignment.topCenter,
                ),
              ],
            )
          : Scaffold(
              body: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 120,
                            child: Row(
                              children: [
                                Image.network(controller
                                    .cartProductModel[index].image
                                    .toString()),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: controller
                                            .cartProductModel[index].name
                                            .toString(),
                                        fontSize: 20,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomText(
                                          color: primaryColor,
                                          text:
                                              '\$  ${controller.cartProductModel[index].price.toString()}'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        color: Colors.grey.shade200,
                                        width: 140,
                                        height: 40,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                                onTap: () => controller
                                                    .increaseQuantity(index),
                                                child: const Icon(Icons.add)),
                                            CustomText(
                                              color: Colors.black,
                                              text: controller
                                                  .cartProductModel[index]
                                                  .quantity
                                                  .toString(),
                                              alignment: Alignment.center,
                                            ),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    bottom: 13),
                                                child: GestureDetector(
                                                    onTap: () => controller
                                                        .decreaseQuantity(
                                                            index),
                                                    child: const Icon(
                                                        Icons.minimize))),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 20);
                        },
                        itemCount: controller.cartProductModel.length),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CustomText(
                            text: 'ToTAL',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GetBuilder<CartViewModel>(
                            builder: (controller) => CustomText(
                              color: primaryColor,
                              text: '\$ ${controller.totlaPrice}',
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                          width: 120,
                          height: 50,
                          child: CustomButton(
                              text: 'CHECKOUT',
                              onpress: () {
                                Get.to(() => const CheckoutView());
                              }))
                    ],
                  ),
                )
              ],
            )),
    );
  }
}
