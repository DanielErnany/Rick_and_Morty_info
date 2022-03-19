import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/caracter.dart';
import 'package:http/http.dart' as http;

class CaractersProvider with ChangeNotifier {
  final String _caracterBaseUrl = 'https://rickandmortyapi.com/api/character';

  List<Caracter> _caracters = [];

  Future<void> loadCaracters() async {
    caracters.clear();
    final response = await http.get(
      Uri.parse(_caracterBaseUrl),
    );

    Map<String, dynamic> data = json.decode(response.body);
    final listaDataCaracter = data['results'];

    listaDataCaracter.forEach((caracter) {
      _caracters.add(
        Caracter(
          id: caracter['id']!,
          name: caracter['name'],
          status: caracter['status'],
          species: caracter['species'],
          gender: caracter['gender'],
          image: caracter['image'],
        ),
      );
    });
  }

  List<Caracter> get caracters => [..._caracters];
}
