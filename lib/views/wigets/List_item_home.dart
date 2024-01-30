import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/utilites/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListItemHome extends StatefulWidget {
  const ListItemHome({super.key, required this.product});

  final Product product;

  @override
  State<ListItemHome> createState() => _ListItemHomeState();
}

class _ListItemHomeState extends State<ListItemHome> {
  @override
  bool isFavorite = false;

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(AppRoutes.productDetailsRoute, arguments: widget.product),
      child: Stack(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.product.imgUrl,
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
                        '${widget.product.discountValue}%',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: size.width * .25,
            bottom: 120,
            child: InkWell(
              onTap: () {
                isFavorite = !isFavorite;
                setState(() {});
              },
              child: SizedBox(
                height: 70,
                width: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.black54,
                          )
                        : const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.black54,
                          ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: 2.75,
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
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey),

                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.product.category,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.product.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: '${widget.product.price}\$  ',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                  ),
                  TextSpan(
                      text:
                          "${widget.product.discountValue == 0 ? widget.product.price : (widget.product.price - (widget.product.price * (widget.product.discountValue! / 100)))}\$",
                      style: Theme.of(context).textTheme.titleMedium),
                ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
