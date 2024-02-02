import 'package:flutter/material.dart';

import '../two_separeted_item.dart';

class CheckOutOrderDetails extends StatelessWidget {
  const CheckOutOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      TwoSeparatedItem(title: "order:", value: '112',),
      SizedBox(height: 8),
      TwoSeparatedItem(title: "Delivery:", value: '112',),
      SizedBox(height: 8),
      TwoSeparatedItem(title: "Summary:", value: '112',),
      SizedBox(height: 8),
    ],);
  }
}
