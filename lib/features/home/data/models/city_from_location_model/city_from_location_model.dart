import 'dart:convert';

import 'address.dart';

class CityFromLocationModel {
  int? placeId;
  String? licence;
  String? osmType;
  int? osmId;
  String? lat;
  String? lon;
  String? category;
  String? type;
  int? placeRank;
  double? importance;
  String? addresstype;
  String? name;
  String? displayName;
  Address? address;
  List<dynamic>? boundingbox;

  CityFromLocationModel({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    this.lat,
    this.lon,
    this.category,
    this.type,
    this.placeRank,
    this.importance,
    this.addresstype,
    this.name,
    this.displayName,
    this.address,
    this.boundingbox,
  });

  factory CityFromLocationModel.fromMap(Map<String, dynamic> data) =>
      CityFromLocationModel(
        placeId: data['place_id'] as int?,
        licence: data['licence'] as String?,
        osmType: data['osm_type'] as String?,
        osmId: data['osm_id'] as int?,
        lat: data['lat'] as String?,
        lon: data['lon'] as String?,
        category: data['category'] as String?,
        type: data['type'] as String?,
        placeRank: data['place_rank'] as int?,
        importance: (data['importance'] as num?)?.toDouble(),
        addresstype: data['addresstype'] as String?,
        name: data['name'] as String?,
        displayName: data['display_name'] as String?,
        address: data['address'] == null
            ? null
            : Address.fromMap(data['address'] as Map<String, dynamic>),
        boundingbox: data['boundingbox'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'place_id': placeId,
        'licence': licence,
        'osm_type': osmType,
        'osm_id': osmId,
        'lat': lat,
        'lon': lon,
        'category': category,
        'type': type,
        'place_rank': placeRank,
        'importance': importance,
        'addresstype': addresstype,
        'name': name,
        'display_name': displayName,
        'address': address?.toMap(),
        'boundingbox': boundingbox,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CityFromLocationModel].
  factory CityFromLocationModel.fromJson(String data) {
    return CityFromLocationModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CityFromLocationModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CityFromLocationModel copyWith({
    int? placeId,
    String? licence,
    String? osmType,
    int? osmId,
    String? lat,
    String? lon,
    String? category,
    String? type,
    int? placeRank,
    double? importance,
    String? addresstype,
    String? name,
    String? displayName,
    Address? address,
    List<String>? boundingbox,
  }) {
    return CityFromLocationModel(
      placeId: placeId ?? this.placeId,
      licence: licence ?? this.licence,
      osmType: osmType ?? this.osmType,
      osmId: osmId ?? this.osmId,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      category: category ?? this.category,
      type: type ?? this.type,
      placeRank: placeRank ?? this.placeRank,
      importance: importance ?? this.importance,
      addresstype: addresstype ?? this.addresstype,
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      address: address ?? this.address,
      boundingbox: boundingbox ?? this.boundingbox,
    );
  }
}
