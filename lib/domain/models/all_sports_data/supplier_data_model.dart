class Supplier {
  Supplier({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  Supplier copyWith({
    String? id,
    String? name,
  }) {
    return Supplier(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Supplier.fromMap(Map<String, dynamic> map) {
    return Supplier(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Supplier.fromJson(String source) => Supplier.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Supplier(id: $id, name: $name)';

  @override
  bool operator ==(covariant Supplier other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
