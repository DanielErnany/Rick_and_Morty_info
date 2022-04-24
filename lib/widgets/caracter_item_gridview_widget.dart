import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_info/models/caracter.dart';

import 'caracter_info_device_widget.dart';

class CaracterItemGridViewWidget extends StatelessWidget {
  final Caracter caracter;
  const CaracterItemGridViewWidget({
    Key? key,
    required this.caracter,
  }) : super(key: key);

  void _showCaracterInfoDevice(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black.withOpacity(0.5),
        barrierDismissible: true,
        pageBuilder: (context, _, __) {
          return CaracterInfoDeviceWidget(
            caracter: caracter,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dimensionsDevice = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => _showCaracterInfoDevice(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              Container(
                height: 15,
                width: 10,
                decoration: BoxDecoration(
                  gradient: caracter.statusColorLowLinearGradient,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          Container(
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
                  height: dimensionsDevice.height * 0.15,
                  width: double.infinity,
                  child: Hero(
                    tag: caracter.id,
                    placeholderBuilder: (_, size, widget) {
                      return CachedNetworkImage(
                        errorWidget: (context, url, error) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.error),
                            Text("error loading"),
                          ],
                        ),
                        imageUrl: caracter.image,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        ),
                      );
                    },
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.error),
                          Text("error loading"),
                        ],
                      ),
                      imageUrl: caracter.image,
                      fit: BoxFit.fill,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    caracter.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: dimensionsDevice.height * 0.005,
                ),
                Text("Status: ${caracter.status}"),
                Text(
                  "Species: ${caracter.species}",
                  overflow: TextOverflow.ellipsis,
                ),
                Text("Gender: ${caracter.gender}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
