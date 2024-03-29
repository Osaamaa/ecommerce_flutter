import 'package:ecommerce/controllers/database_controller.dart';
import 'package:ecommerce/models/delivery_metod.dart';
import 'package:ecommerce/views/wigets/center_indecator.dart';
import 'package:ecommerce/views/wigets/main_bottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/shipping_address.dart';
import '../../../utilites/routes.dart';
import '../../wigets/checkout/checkout_order_details.dart';
import '../../wigets/checkout/delevary_method.dart';
import '../../wigets/checkout/payment_component.dart';
import '../../wigets/checkout/shipping_address_component.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CheckOut',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shipping address",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              StreamBuilder<List<ShippingAddress>>(
                  stream: database.getShippingAddress(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final shippingAddress = snapshot.data;
                      if (shippingAddress == null || shippingAddress.isEmpty) {
                        return Center(
                            child: Column(
                          children: [
                            const Text("No Shipping address"),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              child: Text(
                                "add new one",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.red),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.addShippingAddressRoute,
                                    arguments: database);

                              },
                            )
                          ],
                        ));
                      }
                      return  ShippingAddressComponent(shippingAddress: shippingAddress.first,);
                    }
                    return const CustomCenterIndicator();
                  }),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
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
              const SizedBox(height: 12),
              const PaymentComponent(),
              const SizedBox(height: 24),
              Text(
                "Delivery method",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              StreamBuilder<List<DeliveryMethod>>(
                  stream: database.deliveryMethodsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final deliveryMethods = snapshot.data;
                      if (deliveryMethods == null || deliveryMethods.isEmpty) {
                        return const Center(
                            child: Text("Data is not available"));
                      }
                      return SizedBox(
                        height: size.height * 0.13,
                        child: ListView.builder(
                          itemCount: deliveryMethods.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DeliveryMethodItem(
                              deliveryMethod: deliveryMethods[i],
                            ),
                          ),
                        ),
                      );
                    }
                    return const CustomCenterIndicator();
                  }),
              const SizedBox(height: 32),
              const CheckOutOrderDetails(),
              const SizedBox(height: 64.0),
              MainBottom(
                text: "Submit",
                onTap: () {
                },
                hasBorder: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
