import 'package:flutter/material.dart';
import 'package:rick_and_morty_info/models/caracter.dart';

class CaracterItemGridViewWidget extends StatelessWidget {
  final Caracter caracter;
  const CaracterItemGridViewWidget({
    Key? key,
    required this.caracter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimensionsDevice = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 3,
          color: Colors.grey,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: dimensionsDevice.width * 0.1,
                color: Colors.grey,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      '#${caracter.id}',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
              top: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: Colors.black,
              ),
            ),
            height: dimensionsDevice.height * 0.15,
            width: double.infinity,
            child: Image.network(
              caracter.image,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                caracter.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          SizedBox(
            height: dimensionsDevice.height * 0.005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Status: ${caracter.status}"),
              // Text(caracter.status),
              const SizedBox(
                width: 5,
              ),
              CircleAvatar(
                backgroundColor: caracter.statusColor,
                radius: 5,
              ),
            ],
          ),
          Text("Species: ${caracter.species}"),
          Text("Gender: ${caracter.gender}"),
        ],
      ),
    );
  }
}
