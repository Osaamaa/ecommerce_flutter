class ShippingAddress {
  final String id;
  final String fullName;
  final String address;
  final String city;
  final String state;
  final String country;
  final String zipCode;
  final bool isDefault;

  ShippingAddress({
    required this.id,
    required this.fullName,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    this.isDefault = true,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'fullName': fullName});
    result.addAll({'address': address});
    result.addAll({'city': city});
    result.addAll({'state': state});
    result.addAll({'country': country});
    result.addAll({'zipCode': zipCode});
    result.addAll({'isDefault': isDefault});
    return result;
  }

  factory ShippingAddress.fromMap(Map<String, dynamic> map, String documentId) {
    return ShippingAddress(
        id: documentId,
        fullName: map['fullName'] ?? '',
        address: map['address'] ?? '',
        city: map['city'] ?? '',
        state: map['state'] ?? '',
        country: map['country'] ?? '',
        zipCode: map['zipCode'] ?? '',
        isDefault: map['isDefault'] ?? '');
  }
}
