import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/views/wigets/main_bottom.dart';
import 'package:flutter/material.dart';

import '../wigets/drob_down.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var dropdownValue="hello";
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              widget.product.title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                widget.product.imgUrl,
                width: double.infinity,
                height: size.height * .5,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: DropDownMenuComponent(
                              items: const ['S', 'M', 'L', 'XL', 'XXL'],
                              hint: 'Size',
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            isFavorite = !isFavorite;
                            setState(() {});
                          },
                          child: SizedBox(
                            height: 80,
                            width: 80,
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
                                        size: 30,
                                      )
                                    : const Icon(
                                        Icons.favorite_border_outlined,
                                        color: Colors.black54,
                                        size: 30,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.title,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text("\$${widget.product.price}",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(widget.product.category,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.grey.withOpacity(0.9),
                                )),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                        'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.grey.withOpacity(0.9),
                                )),
                    const SizedBox(
                      height: 15,
                    ),
                    MainBottom(
                      text: "ADD TO CART",
                      onTap: () {},
                      hasBorder: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
