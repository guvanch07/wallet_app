import 'package:flutter/foundation.dart';

import 'package:wallet_app/domain/models/all_sports_data/supplier_data_model.dart';

class MapMarker {
  MapMarker({
    required this.lat,
    required this.lng,
    required this.suppliers,
  });

  final double? lat;
  final double? lng;
  final List<Supplier> suppliers;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
      'suppliers': suppliers.map((x) => x.toMap()).toList(),
    };
  }

  factory MapMarker.fromMap(Map<String, dynamic> map) {
    return MapMarker(
        lat: map['lat'] != null ? map['lat'] as double : null,
        lng: map['lng'] != null ? map['lng'] as double : null,
        suppliers: List<Supplier>.from(
          map["suppliers"].map(
            (x) => Supplier.fromMap(x),
          ),
        ));
  }

  @override
  String toString() => 'MapMarker(lat: $lat, lng: $lng, suppliers: $suppliers)';

  @override
  bool operator ==(covariant MapMarker other) {
    if (identical(this, other)) return true;

    return other.lat == lat &&
        other.lng == lng &&
        listEquals(other.suppliers, suppliers);
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode ^ suppliers.hashCode;
}
