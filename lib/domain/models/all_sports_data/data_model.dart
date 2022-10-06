import 'package:flutter/foundation.dart';

import 'package:wallet_app/domain/models/all_sports_data/map_marker_data_model.dart';

class Data {
  Data({
    required this.mapMarkers,
  });

  final List<MapMarker>? mapMarkers;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mapMarkers': mapMarkers?.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      mapMarkers: map['mapMarkers'] != null
          ? List<MapMarker>.from(
              (map['mapMarkers'] as List<int>).map<MapMarker?>(
                (x) => MapMarker.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Data.fromJson(String source) => Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Data(mapMarkers: $mapMarkers)';

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return listEquals(other.mapMarkers, mapMarkers);
  }

  @override
  int get hashCode => mapMarkers.hashCode;
}
