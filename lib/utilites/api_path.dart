class ApiPath{
  static String products="products/";
  static String user(String uid)=>"users/$uid";
  static String addToCart(String uid,String productId) => "users/$uid/addToCart/$productId";
  static String myProductCart(String uid) => "users/$uid/addToCart/";
  static String deliveryMethod() => "delivaryMethods/";
}