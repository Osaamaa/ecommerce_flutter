import 'package:ecommerce/controllers/database_controller.dart';
import 'package:ecommerce/models/add_to_cart_model.dart';
import 'package:ecommerce/utilites/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wigets/cart_list_Item.dart';
import '../wigets/main_bottom.dart';
import '../wigets/two_separeted_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var amount = 0;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final myProducts = await Provider.of<Database>(context, listen: false)
        .myProductCart()
        .first;
    for (var element in myProducts) {
      setState(() {
        amount += element.price;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
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
                      const SizedBox(
                        height: 16,
                      ),
                       TwoSeparatedItem(title: "Total amount", value: amount.toString(),),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20),
                        child: MainBottom(
                          text: 'Checkout',
                          onTap: () {
                            Navigator.of(context,rootNavigator: true)
                                .pushNamed(AppRoutes.checkOutPageRoute,arguments: database);
                          },
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
