import 'dart:convert';

class AddressModel {
  int id;
  String street;
  String locality;
  String? countryCode;
  String? country;
  String? postalCode;
  String? latlng;
  int userId;

  AddressModel({
    required this.id,
    required this.street,
    required this.locality,
    this.countryCode,
    this.country,
    this.postalCode,
    this.latlng,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'street': street,
      'locality': locality,
      'countryCode': countryCode,
      'country': country,
      'postalCode': postalCode,
      'latlng': latlng,
      'userId': userId,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] as int,
      street: map['street'] as String,
      locality: map['locality'] as String,
      countryCode:
          map['country_code'] != null ? map['country_code'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      postalCode:
          map['postal_code'] != null ? map['postal_code'] as String : null,
      latlng: map['latlng'] != null ? map['latlng'] as String : null,
      userId: map['user_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressModel(id: $id, street: $street, locality: $locality, countryCode: $countryCode, country: $country, postalCode: $postalCode, latlng: $latlng, userId: $userId)';
  }
}
