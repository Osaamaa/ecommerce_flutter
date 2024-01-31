import 'package:ecommerce/controllers/database_controller.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/utilites/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Product_Details_Container.dart';
import 'favorite_bottom.dart';
import 'img_with_descound.dart';

class ListItemHome extends StatelessWidget {
  const ListItemHome({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(AppRoutes.productDetailsRoute, arguments: {
        'product': product,
        'database': database,
      }),
      child: Stack(
        children: [
          ImgWithDiscound(
            product: product,
          ),
          const FavoriteBottom(),
          ProductDetailsContainer(
            product: product,
          ),
        ],
      ),
    );
  }
}
