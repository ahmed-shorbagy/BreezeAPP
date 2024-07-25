import 'dart:convert';

class Address {
  String? houseNumber;
  String? road;
  String? suburb;
  String? city;
  String? state;
  String? iso31662Lvl4;
  String? postcode;
  String? country;
  String? countryCode;

  Address({
    this.houseNumber,
    this.road,
    this.suburb,
    this.city,
    this.state,
    this.iso31662Lvl4,
    this.postcode,
    this.country,
    this.countryCode,
  });

  factory Address.fromMap(Map<String, dynamic> data) => Address(
        houseNumber: data['house_number'] as String?,
        road: data['road'] as String?,
        suburb: data['suburb'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        iso31662Lvl4: data['ISO3166-2-lvl4'] as String?,
        postcode: data['postcode'] as String?,
        country: data['country'] as String?,
        countryCode: data['country_code'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'house_number': houseNumber,
        'road': road,
        'suburb': suburb,
        'city': city,
        'state': state,
        'ISO3166-2-lvl4': iso31662Lvl4,
        'postcode': postcode,
        'country': country,
        'country_code': countryCode,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Address].
  factory Address.fromJson(String data) {
    return Address.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Address] to a JSON string.
  String toJson() => json.encode(toMap());

  Address copyWith({
    String? houseNumber,
    String? road,
    String? suburb,
    String? city,
    String? state,
    String? iso31662Lvl4,
    String? postcode,
    String? country,
    String? countryCode,
  }) {
    return Address(
      houseNumber: houseNumber ?? this.houseNumber,
      road: road ?? this.road,
      suburb: suburb ?? this.suburb,
      city: city ?? this.city,
      state: state ?? this.state,
      iso31662Lvl4: iso31662Lvl4 ?? this.iso31662Lvl4,
      postcode: postcode ?? this.postcode,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
