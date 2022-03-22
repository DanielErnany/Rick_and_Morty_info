import 'dart:convert';

import 'package:flutter/material.dart';

class Caracter with ChangeNotifier {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  Caracter({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  RadialGradient get statusColorRadialGradient {
    RadialGradient color;

    switch (status) {
      case "Alive":
        color = const RadialGradient(
          colors: [
            Color.fromRGBO(1, 138, 58, 1),
            Color.fromRGBO(116, 212, 43, 1),
            Color.fromRGBO(204, 255, 0, 1),
          ],
        );

        break;
      case "Dead":
        color = const RadialGradient(
          colors: [
            Colors.redAccent,
            Colors.orange,
            Color.fromRGBO(204, 255, 0, 1),
          ],
        );
        break;
      default:
        color = const RadialGradient(
          colors: [
            Colors.blueGrey,
            Colors.grey,
            Colors.white,
          ],
        );
        break;
    }

    return color;
  }

  Caracter copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? gender,
    String? image,
  }) {
    return Caracter(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'gender': gender,
      'image': image,
    };
  }

  factory Caracter.fromMap(Map<String, dynamic> map) {
    return Caracter(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      species: map['species'] ?? '',
      gender: map['gender'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Caracter.fromJson(String source) =>
      Caracter.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Caracter(id: $id, name: $name, status: $status, species: $species, gender: $gender, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Caracter &&
        other.id == id &&
        other.name == name &&
        other.status == status &&
        other.species == species &&
        other.gender == gender &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        status.hashCode ^
        species.hashCode ^
        gender.hashCode ^
        image.hashCode;
  }
}
