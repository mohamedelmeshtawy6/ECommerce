import 'package:e_commerce/constance.dart';
import 'package:e_commerce/helper/enum.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  const DeliveryTime({super.key});

  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivary delivary = Delivary.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          RadioListTile<Delivary>(
            value: Delivary.StandardDelivery,
            groupValue: delivary,
            onChanged: (Delivary? val) {
              setState(() {
                delivary = val!;
              });
            },
            activeColor: primaryColor,
            title: CustomText(
              text: 'Standard Delivery',
              fontSize: 27,
            ),
            subtitle: CustomText(
                text: '\nOrder will be delivered between 3 - 5 business days'),
          ),
          const SizedBox(
            height: 20,
          ),
          RadioListTile<Delivary>(
            value: Delivary.NextDayDelivery,
            groupValue: delivary,
            onChanged: (Delivary? val) {
              setState(() {
                delivary = val!;
              });
            },
            activeColor: primaryColor,
            title: CustomText(
              text: 'Next Day Delivery',
              fontSize: 27,
            ),
            subtitle: CustomText(
                text:
                    '\nPlace your order before 6pm and your items will be delivered the next day'),
          ),
          const SizedBox(
            height: 20,
          ),
          RadioListTile<Delivary>(
            value: Delivary.NominatedDelivery,
            groupValue: delivary,
            onChanged: (Delivary? val) {
              setState(() {
                delivary = val!;
              });
            },
            activeColor: primaryColor,
            title: CustomText(
              text: 'Nominated Delivery',
              fontSize: 27,
            ),
            subtitle: CustomText(
                text:
                    '\nPick a particular date from the calendar and order will be delivered on selected date'),
          ),
        ],
      ),
    );
  }
}
