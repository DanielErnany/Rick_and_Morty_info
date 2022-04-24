import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_info/models/caracter.dart';
import 'package:rick_and_morty_info/widgets/led_animated_widget.dart';

import 'acid_drop_widget.dart';

class CaracterInfoDeviceWidget extends StatefulWidget {
  final Caracter caracter;
  const CaracterInfoDeviceWidget({
    Key? key,
    required this.caracter,
  }) : super(key: key);

  @override
  State<CaracterInfoDeviceWidget> createState() =>
      _CaracterInfoDeviceWidgetState();
}

class _CaracterInfoDeviceWidgetState extends State<CaracterInfoDeviceWidget> {
  @override
  Widget build(BuildContext context) {
    final dimensionsDevice = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: dimensionsDevice.width * 0.7,
        height: dimensionsDevice.height * 0.55,
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 10,
              child: LedAnimatedWidget(
                highGradient: widget.caracter.statusColorHighLinearGradient,
                lowGradient: widget.caracter.statusColorLowLinearGradient,
              ),
            ),
            Positioned(
              bottom: 0,
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
                                  '#${widget.caracter.id}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
                        child: Hero(
                          tag: widget.caracter.id,
                          child: CachedNetworkImage(
                            imageUrl: widget.caracter.image,
                            fit: BoxFit.fill,
                            errorWidget: (context, url, error) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.error),
                                Text("error loading"),
                              ],
                            ),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          widget.caracter.name,
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: dimensionsDevice.height * 0.005,
                      ),
                      Text(
                        "Status: ${widget.caracter.status}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "Species: ${widget.caracter.species}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      if (widget.caracter.type.isNotEmpty)
                        Text(
                          "Type: ${(widget.caracter.type)}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      Text(
                        "Gender: ${widget.caracter.gender}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "Origin: ${widget.caracter.origin}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "Location: ${widget.caracter.location}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
