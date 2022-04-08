import 'dart:convert';

import 'package:flutter/material.dart';

class Caracter with ChangeNotifier {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;

  final String origin;
  final String location;
  Caracter({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
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

  LinearGradient get statusColorLinearGradient {
    LinearGradient color;

    switch (status) {
      case "Alive":
        color = const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 1, 42, 18),
            Color.fromRGBO(1, 138, 58, 1),
          ],
        );

        break;
      case "Dead":
        color = const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 94, 1, 1),
            Color.fromARGB(255, 196, 3, 3),
            // Colors.redAccent,
          ],
        );
        break;
      default:
        color = LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 150, 150, 150),
            Colors.grey.shade300,
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
    String? type,
    String? gender,
    String? image,
    String? origin,
    String? location,
  }) {
    return Caracter(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      origin: origin ?? this.origin,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'image': image,
      'origin': origin,
      'location': location,
    };
  }

  factory Caracter.fromMap(Map<String, dynamic> map) {
    return Caracter(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      species: map['species'] ?? '',
      type: map['type'] ?? '',
      gender: map['gender'] ?? '',
      image: map['image'] ?? '',
      origin: map['origin']['name'],
      location: map['location']['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Caracter.fromJson(String source) =>
      Caracter.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Caracter(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, image: $image, origin: $origin, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Caracter &&
        other.id == id &&
        other.name == name &&
        other.status == status &&
        other.species == species &&
        other.type == type &&
        other.gender == gender &&
        other.image == image &&
        other.origin == origin &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        status.hashCode ^
        species.hashCode ^
        type.hashCode ^
        gender.hashCode ^
        image.hashCode ^
        origin.hashCode ^
        location.hashCode;
  }
}
