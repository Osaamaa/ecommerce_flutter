import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/product.dart';

class ProductDetailsContainer extends StatelessWidget {
  const ProductDetailsContainer({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          Row(
            children: [
              RatingBarIndicator(
                rating: 2.7,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 30.0,
                direction: Axis.horizontal,
              ),
              Text(
                "(100)",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.category,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
              text: '${product.price}\$  ',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            TextSpan(
                text:
                "${product.discountValue == 0 ? product.price : (product.price - (product.price * (product.discountValue! / 100)))}\$",
                style: Theme.of(context).textTheme.titleMedium),
          ]))
        ],
      ),
    );
  }
}
