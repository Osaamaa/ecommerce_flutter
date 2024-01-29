import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class ListItemHome extends StatelessWidget {
  const ListItemHome({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.imgUrl,
                    width: 200,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 50,
                    height: 30,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          '${product.discountValue}%',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.category!,
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
                text: '${product.price}\$',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
              TextSpan(
                  text: "${product.discountValue == 0 ? product.price : (product.price - (product.price * (product.discountValue! / 100)))}\$",
                  style: Theme.of(context).textTheme.titleMedium),
            ]))
          ],
        ),
      ),
    );
  }
}
