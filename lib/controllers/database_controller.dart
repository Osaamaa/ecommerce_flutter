import 'package:ecommerce/models/add_to_cart_model.dart';
import 'package:ecommerce/utilites/api_path.dart';
import '../models/delivery_metod.dart';
import '../models/product.dart';
import '../models/user_date.dart';
import '../services/firestore_services.dart';

abstract class Database {
  Stream<List<Product>> salesProductsStream();

  Stream<List<Product>> newProductsStream();
  Stream<List<AddToCartModel>> myProductCart();
  Stream<List<DeliveryMethod>> deliveryMethodsStream();

  Future<void> setUserData(UserData userData);

  Future<void> addToCart(AddToCartModel product);

}

class FireStoreDatabase implements Database {
  final String uid;
  final _service = FireStoreServices.instance;

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

  @override
  Future<void> setUserData(UserData userData) async => await _service.setData(
        path: ApiPath.user(userData.uid),
        data: userData.toMap(),
      );

  @override
  Future<void> addToCart(AddToCartModel product) async => _service.setData(
        path: ApiPath.addToCart(uid, product.id),
        data: product.toMap(),
      );

  @override
  Stream<List<AddToCartModel>> myProductCart() => _service.collectionsStream(
      path: ApiPath.myProductCart(uid),
      builder: (data, documentID) => AddToCartModel.fromMap(data!, documentID));

  @override

  Stream<List<DeliveryMethod>> deliveryMethodsStream() =>
      _service.collectionsStream(
          path: ApiPath.deliveryMethod(),
          builder: (data, documentId) =>
              DeliveryMethod.fromMap(data!, documentId));


}
