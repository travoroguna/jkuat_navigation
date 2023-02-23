// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Place {
  final int id;
  final String name;
  final String latitude;
  final String longitude;
  final String image;
  final String shortName;
  Place({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.image,
    required this.shortName,
  });

  Place copyWith({
    int? id,
    String? name,
    String? latitude,
    String? longitude,
    String? image,
    String? shortName,
  }) {
    return Place(
      id: id ?? this.id,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      image: image ?? this.image,
      shortName: shortName ?? this.shortName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'image': image,
      'shortName': shortName,
    };
  }

  factory Place.fromMap(Map<dynamic, dynamic> map) {
    return Place(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      image: map['image'] ?? '',
      shortName: map['short_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) =>
      Place.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Place(id: $id, name: $name, latitude: $latitude, longitude: $longitude, image: $image, shortName: $shortName)';
  }

  @override
  bool operator ==(covariant Place other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.image == image &&
        other.shortName == shortName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        image.hashCode ^
        shortName.hashCode;
  }
}
