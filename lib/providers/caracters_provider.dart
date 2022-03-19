import 'package:flutter/cupertino.dart';

import '../models/caracter.dart';

class CaractersProvider with ChangeNotifier {
  List<Caracter> _caracters = [
    Caracter(
      id: 1,
      name: "Rick Sanchez",
      status: "Alive",
      species: "Human",
      gender: "Male",
      image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
    ),
    Caracter(
      id: 2,
      name: "Morty Smith",
      status: "Alive",
      species: "Human",
      gender: "Male",
      image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
    ),
    Caracter(
      id: 3,
      name: "Summer Smith",
      status: "Alive",
      species: "Human",
      gender: "Male",
      image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
    ),
  ];

  List<Caracter> get caracters 
    => [..._caracters];
  
}
