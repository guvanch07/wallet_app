// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'data_model.dart';

class GymDataModel {
  GymDataModel({
    required this.data,
  });

  final Data? data;

  GymDataModel copyWith({
    Data? data,
  }) {
    return GymDataModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data?.toMap(),
    };
  }

  factory GymDataModel.fromMap(Map<String, dynamic> map) {
    return GymDataModel(
      data: map['data'] != null
          ? Data.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GymDataModel.fromJson(String source) =>
      GymDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GymDataModel(data: $data)';

  @override
  bool operator ==(covariant GymDataModel other) {
    if (identical(this, other)) return true;

    return other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}
