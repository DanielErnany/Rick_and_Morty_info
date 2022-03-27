import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_info/models/caracter.dart';

import 'acid_drop_widget.dart';

class CaracterInfoDeviceWidget extends StatelessWidget {
  final Caracter caracter;
  const CaracterInfoDeviceWidget({
    Key? key,
    required this.caracter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimensionsDevice = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: dimensionsDevice.height * 0.5,
        width: dimensionsDevice.width * 0.7,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 5,
            color: Colors.grey,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: dimensionsDevice.height * 0.2,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: caracter.image,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (_, url, download) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Center(
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    caracter.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              SizedBox(
                height: dimensionsDevice.height * 0.005,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Status: ${caracter.status}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  AcidDropWidget(
                    height: 12,
                    width: 12,
                    radialGradient: caracter.statusColorRadialGradient,
                  ),
                ],
              ),
              Text(
                "Species: ${caracter.species}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (caracter.type.isNotEmpty)
                Text(
                  "Type: ${(caracter.type)}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              Text(
                "Gender: ${caracter.gender}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Origin: ${caracter.origin}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Location: ${caracter.location}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
