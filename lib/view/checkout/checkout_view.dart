import 'package:e_commerce/core/view_model/checkout_viewmodel.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/enum.dart';
import 'summary_widget.dart';

import 'add_address_widget.dart';
import 'delevery_time_widget.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: CheckoutViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            controller.index == 0
                ? 'Delivary'
                : controller.index == 1
                    ? "Address"
                    : "Summary",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              controller.pages == Pages.deliveryTime
                  ? const DeliveryTime()
                  : controller.pages == Pages.addAddress
                      ? const AddAddress()
                      : const SummaryP(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.index == 0
                      ? Container()
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 150,
                            height: 90,
                            child: CustomButton(
                                text: 'Back',
                                onpress: () {
                                  controller.changeIndex(controller.index - 1);
                                }),
                          ),
                        ),
                  controller.index < 2
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 150,
                            height: 90,
                            child: CustomButton(
                                text: 'Next',
                                onpress: () {
                                  controller.changeIndex(controller.index + 1);
                                }),
                          ),
                        )
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 150,
                            height: 90,
                            child: CustomButton(
                                text: 'Deliver',
                                onpress: () {
                                  controller.changeIndex(controller.index + 1);
                                }),
                          ),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
