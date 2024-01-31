import 'package:flutter/material.dart';

import '../../models/product.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text("\$${product.price}",
                style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(product.category,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.grey.withOpacity(0.9),
            )),
      ],
    );
  }
}
