import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'List_item_home.dart';
import 'center_indecator.dart';
import 'custom_header_widget.dart';
import 'custom_no_data_available.dart';

class ListOfProducts extends StatelessWidget {
  ListOfProducts(
      {super.key,
        required this.database,
        required this.title,
        required this.description});

  String title, description;
  Stream<List<Product>>? database;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomHeaderWidget(
            title: title,
            description: description,
          ),
          SizedBox(
            height: 340,
            child: StreamBuilder<List<Product>>(
                stream: database,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    final products = snapshot.data;
                    if (products == null || products.isEmpty) {
                      return const CustomNoDataAvailable();
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListItemHome(product: products[index]),
                      ),
                    );
                  }
                  return const CustomCenterIndicator();
                }),
          ),
        ],
      ),
    );
  }
}
