import 'package:ecommerce/models/shipping_address.dart';
import 'package:flutter/material.dart';

class ShippingAddressComponent extends StatelessWidget {
  const ShippingAddressComponent({super.key, required this.shippingAddress});
final ShippingAddress shippingAddress;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(shippingAddress.fullName,style: Theme.of(context).textTheme.titleMedium,),
                InkWell(
                    onTap: () {},
                    child: Text(
                      "Change",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.red),
                    ))
              ],
            ),
            const SizedBox(height: 8,),
             Text(shippingAddress.address,style: Theme.of(context).textTheme.titleMedium,),
             Text(shippingAddress.city,style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
      ),
    );
  }
}
