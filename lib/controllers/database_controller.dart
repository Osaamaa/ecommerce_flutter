import 'package:ecommerce/utilites/api_path.dart';

import '../models/product.dart';
import '../services/firestore_services.dart';

abstract class Database {
  Stream<List<Product>> salesProductsStream();

  Stream<List<Product>> newProductsStream();
}

class FireStoreDatabase implements Database {
  final String uid;
  final _service = FirestoreServices.instance;

  FireStoreDatabase(this.uid);

  @override
  Stream<List<Product>> salesProductsStream() => _service.collectionsStream(
        path: ApiPath.products,
        builder: (data, documentId) => Product.fromMap(data!, documentId),
        queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0),
      );

  @override
  Stream<List<Product>> newProductsStream() => _service.collectionsStream(
        path: ApiPath.products,
        builder: (data, documentId) => Product.fromMap(data!, documentId),
  );
}
