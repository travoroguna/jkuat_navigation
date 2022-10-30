// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Account {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String image;
  Account({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
  });

  Account copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? image,
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'image': image,
    };
  }

  factory Account.fromMap(Map<dynamic, dynamic> map) {
    return Account(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Account(id: $id, name: $name, phone: $phone, email: $email, image: $image)';
  }

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        image.hashCode;
  }
}
