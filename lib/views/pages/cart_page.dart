import 'package:ecommerce/controllers/database_controller.dart';
import 'package:ecommerce/models/add_to_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wigets/cart_list_Item.dart';
import '../wigets/main_bottom.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    var amount=0;
    return SafeArea(
      child: StreamBuilder<List<AddToCartModel>>(
          stream: database.myProductCart(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final cartItems = snapshot.data;
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox.shrink(),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.search))
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "My Cart",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                      ),
                      if (cartItems == null || cartItems.isEmpty)
                        const Center(
                          child: Text("No Data Available"),
                        ),
                      if (cartItems != null && cartItems.isNotEmpty)
                        ListView.builder(
                          itemCount: cartItems.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int i) {
                            return CartListItem(
                              cartItem: cartItems[i],
                            );
                          },
                        ),
                      const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total amount",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.grey),
                          ),
                          Text(
                            "$amount\$",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.black),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20),
                        child: MainBottom(
                          text: 'Checkout',
                          onTap: () {},
                          hasBorder: true,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
