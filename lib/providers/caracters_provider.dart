import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../exceptions/http_exeption.dart';
import '../models/caracter.dart';
import 'package:http/http.dart' as http;

class CaractersProvider with ChangeNotifier {
  final String _caracterBaseUrl = 'https://rickandmortyapi.com/api/character';

  String? _apiNextPage;
  String? _apiPrevPage;

  List<Caracter> _caracters = [];

  Future<bool?> loadCaracters({bool isRefresh = false}) async {
    String? urlRequest;

    if (isRefresh) {
      urlRequest = _caracterBaseUrl;
    } else {
      if (_apiNextPage == null) {
        return Future.value();
      }
      urlRequest = _apiNextPage;
    }

    final response = await http.get(
      Uri.parse(urlRequest!),
    );

    if (response.statusCode >= 400) {
      _caracters.clear();
      notifyListeners();

      throw const HttpException('Error loading characters');
    }

    Map<String, dynamic> data = json.decode(response.body);
    Map<String, dynamic> pageInfo = data['info'];

    _apiNextPage = pageInfo['next'];
    _apiPrevPage = pageInfo['prev'];
    final listaDataCaracter = data['results'];

    if (isRefresh) _caracters.clear();

    listaDataCaracter.forEach((caracter) {
      _caracters.add(
        Caracter.fromMap(caracter),
      );
    });
    notifyListeners();
    return Future.value();
  }

  List<Caracter> get caracters => [..._caracters];
}
