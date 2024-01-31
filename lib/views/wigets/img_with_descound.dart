import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class ImgWithDiscound extends StatelessWidget {
  const ImgWithDiscound({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            product.imgUrl,
            width: 200,
            height: 200,
          ),
        ),
        const SizedBox(height: 30,),
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
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
