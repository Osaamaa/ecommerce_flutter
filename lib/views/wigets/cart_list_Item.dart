import 'package:ecommerce/models/add_to_cart_model.dart';
import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.cartItem});

  final AddToCartModel cartItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(16) ,bottomLeft:Radius.circular(16) ),
              child: Image.network(
                cartItem.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    cartItem.title,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'Color: ',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.grey,
                                      )),
                          TextSpan(
                            text: cartItem.color,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ]),
                      ),
                      Text.rich(
                        TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: '  Size: ',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.grey,
                                      )),
                          TextSpan(
                            text: cartItem.size,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.more_vert),
                  Text(
                    '${cartItem.price}\$',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
